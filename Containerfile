FROM registry.access.redhat.com/ubi9-minimal:9.6-1747218906
LABEL maintainer="Ryan Edgell" \
      name="ibmcloud/climcpserver" \
      description="IBM Cloud MCP Server: Model Context Protocol for IBM Cloud"

ARG IBMCLOUD_VERSION=2.35.0
ARG IBMCLOUD_ARCH=amd64
ARG IBMCLOUD_PLUGINS

# Install required system packages including jq for JSON parsing
RUN microdnf update -y && \
    microdnf install -y tar-1.34 gzip-1.12 procps-ng-3.3.17 jq-1.6 && \
    microdnf clean all

# Copy all MCP configuration files
COPY src/*/configs/*.json /app/configs/

COPY ./start.sh /app/start.sh
RUN chmod +x /app/start.sh

COPY ./healthcheck.sh /app/healthcheck.sh
RUN chmod +x /app/healthcheck.sh

# Update permissions for non-root user
RUN chown -R 1001:0 /app && \
    chmod -R g=u /app

ENV IBMCLOUD_HOME=/app

EXPOSE 4141

WORKDIR /app

# Run as non-root user
USER 1001

# Download, install, and configure IBM Cloud CLI
RUN curl -L "https://download.clis.cloud.ibm.com/ibm-cloud-cli/${IBMCLOUD_VERSION}/IBM_Cloud_CLI_${IBMCLOUD_VERSION}_${IBMCLOUD_ARCH}.tar.gz" -o /tmp/ibmcloud.tar.gz && \
    tar -xf /tmp/ibmcloud.tar.gz -C /tmp && \
    mv /tmp/Bluemix_CLI/bin/ibmcloud . && \
    rm -rf /tmp/ibmcloud.tar.gz /tmp/Bluemix_CLI

# Install IBM Cloud CLI and plugins
## Ignores hadolint rule because "|| true" is specifically set to prevent image build failure on plugin warning messages.
#hadolint ignore=SC2015
RUN if [ -n "${IBMCLOUD_PLUGINS}" ]; then \
        /app/ibmcloud plugin install $IBMCLOUD_PLUGINS -f -q || true; \
    else \
        echo "No specific plugins specified, installing all..." && \
        /app/ibmcloud plugin install --all -f -q || true; \
    fi

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD ["/app/healthcheck.sh"]
# Start the application
CMD ["./start.sh"]
