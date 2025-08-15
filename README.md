# IBM Cloud MCP Servers

This project contains MCP Servers for IBM Cloud which provide an interface layer between AI assistants and IBM Cloud services. This README details how to install, build, configure, and run the MCP Server(s) for development and testing.

## Overview

The core MCP server implementation for IBM Cloud is built directly into the IBM Cloud CLI native binaries.

> All MCP features are provided as **EXPERIMENTAL** features at this time.

There are two runtime scenarios supported:

1. **Local install - Core MCP Server** - Configure any MCP Host Application (e.g. Claude, VSCode, Cursor, Cline, mcp-cli) to use IBM Cloud CLI as an MCP server.  This scenario involves installing the IBM Cloud CLI locally and then updating the host application's JSON MCP configuration settings to use the IBM Cloud CLI in MCP mode and specifying `stdio` with the `--mcp-transport` parameter.
2. **Containerized MCP Servers** - Use the Container provided in the root directory to build fit-for-purpose containerized versions of the IBM Cloud MCP Server which can be deployed on any container runtime (e.g. podman, docker, IBM Cloud Code Engine, Redhat OpenShift, Kubernetes) to run as an MCP Remote server. This scenario involves building the container file with an optional configuration profile, providing environment variables to configure the appropriate tools to be exposed via MCP, and securely configuring the credentials to be used for the container.

## 💻 Local Install - Core MCP Server and Plugin Modules

### Don't have IBM Cloud CLI? --> Install it!

Simply [install the IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-install-ibmcloud-cli)--that's all you need!

### Already have IBM Cloud CLI? --> Check to see if you have MCP features

If you already have the IBM Cloud CLI installed, check to see if MCP features are available:

```sh
ibmcloud --help
```

If you already have the MCP feature, you will see the following section near the bottom of the output:

```text
MCP OPTIONS:
  --mcp-transport      [EXPERIMENTAL] Specify the transport to start the MCP server. Valid options are `stdio` or a valid `HTTP SSE URL`.
  --mcp-tools          [EXPERIMENTAL] Specifies an optional comma-delimited list of commands to expose as MCP tools.
  --mcp-allow-write    [EXPERIMENTAL] Allows write operations for tasks such as creating a resource.
```

If you don't have the MCP feature, update with:

```sh
ibmcloud update
ibmcloud --help
```

Verify that the `MCP OPTIONS` are available as above and proceed with configuring your host application to use the IBM Cloud MCP Server (proceed to the `Usage` section below).

## 🤏🏻 Usage (Local Installs)

1. Obtain an IBM Cloud **API key** with minimal permissions for testing.
  _This should preferably be a **service id** api-key rather than user api-key, to restrict access privileges to only areas of IBM Cloud that you will be testing with the MCP server. For the name of the service id, you can use the name of a fictional platform engineering agent like, “<your_initials>-network-engineer” or “<your_initials>-account-manager”.  Then create an access group that assigns your new service id with the restricted access permissions that you want to allow the simulated agent to use. For more information consult the [IBM Cloud documentation](https://cloud.ibm.com/docs/account?topic=account-serviceidapikeys&interface=ui)._
2. Find the path to your IBM Cloud CLI binary:

    ```bash
    where ibmcloud
    ```

3. Log in:

    ```bash
    ibmcloud login --apikey <your-api-key>
    ```

4. Set up a host app like [mcp-cli](https://github.com/chrishayuk/mcp-cli) and configure the MCP json for the host app to point to the IBM Cloud CLI binary and allowed tools:

    > TIP: tool names follow the command namespaces in the IBM Cloud CLI. For example, the namespace `resource_groups` maps to the CLI command `ibmcloud resource groups`

    ```json
    {
      "mcpServers": {
        "ibmcloud": {
          "command": "/path/to/ibmcloud",
          "args": [
            "--mcp-transport", "stdio",
            "--mcp-tools", "resource_groups,target,MORE COMMANDS HERE THAT LIST AND VIEW RESOURCES"
          ]
        }
      }
    }
    ```

## 🛡️ Safe mode -- Read-only by default

The default configuration of IBM Cloud MCP Server will run in **Safe Mode** which will not allow tools which make changes to IBM Cloud resources to be invoked via MCP.  To override this default behavior, use the `--mcp-allow-write` argument in the mcp configuration, eg.:

```json
{
  "mcpServers": {
    "ibmcloud": {
      "command": "/path/to/ibmcloud",
      "args": [
        "--mcp-transport", "stdio",
        "--mcp-allow-write",
        "--mcp-tools", "resource_groups,target,ADD COMMANDS THAT CREATE UPDATE OR DELETE RESOURCES"
      ]
    }
  }
}
```

## 📦 Containerized IBMCloud MCP Servers

A Containerfile and Makefile for building IBM Cloud MCP Server containers are located in the root directory. The container supports multiple service-specific configurations that can be selected at build time or runtime.

>You can also use the IBM Cloud MCP Server Containerized installation instead of the Local Install steps in the previous section if you have `podman`, `docker` or similar container runtime installed locally.

### 📋 Available Configuration Profiles

The container includes pre-configured profiles for different IBM Cloud services. To list all available profiles:

```bash
make list-configs
```

Example profiles include:

- `vpc-instance` - VPC instance management
- `ks` - Kubernetes cluster management
- `code_engine_apps` - Code Engine application management

### 🧾 Prerequisites

To build, run, and deploy this project, you will need the following installed:

- `make`
- Containerization tool: `podman` or `docker`
- `curl` (for testing)
- [`hadolint`](https://github.com/hadolint/hadolint?tab=readme-ov-file#install) (for linting Containerfiles)
- [`dockle`](https://github.com/goodwithtech/dockle) (for linting container images)
- [`trivy`](https://trivy.dev/v0.60/getting-started/installation/) (for scanning container images for vulnerabilities)
- IBM Cloud CLI with `container-registry` and `code-engine` plugins

### 🗜️ Building the Container Image

The project uses a `Containerfile` to define the container image. You can build the image using either Podman or Docker via the Makefile targets.

* **Using Podman:**
    ```bash
    make podman
    ```

* **Using Docker:**
    ```bash
    make docker
    ```

An optional parameter of `IBMCLOUD_PLUGINS=one,two,three` can be added to the build commands. All plugins will be installed if this is not provided.

Configuration profiles are selected at runtime using environment variables (CONFIG_PROFILE or IBMCLOUD_MCP_TOOLS).

### Running the Container with an MCP Client

The container supports two configuration methods:
1. **CONFIG_PROFILE** - Use a pre-defined configuration profile
2. **IBMCLOUD_MCP_TOOLS** - Specify tools directly (fallback if CONFIG_PROFILE not set)

#### Using CONFIG_PROFILE:
```json
{
    "mcpServers": {
        "ibmcloud-core": {
            "command": "/opt/podman/bin/podman",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "IBMCLOUD_API_KEY",
                "-e",
                "IBMCLOUD_REGION",
                "-e",
                "IBMCLOUD_RESOURCE_GROUP",
                "-e",
                "CONFIG_PROFILE",
                "-e",
                "IBMCLOUD_MCP_TRANSPORT",
                "ibmcloud/climcpserver"
            ],
            "env": {
                "IBMCLOUD_API_KEY": "<Your API key>",
                "IBMCLOUD_REGION": "us-south",
                "IBMCLOUD_RESOURCE_GROUP": "default",
                "CONFIG_PROFILE": "vpc-instance",
                "IBMCLOUD_MCP_TRANSPORT": "stdio"
            }
        }
    }
}
```

#### Using IBMCLOUD_MCP_TOOLS directly:
```json
{
    "mcpServers": {
        "ibmcloud-core": {
            "command": "/opt/podman/bin/podman",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "IBMCLOUD_API_KEY",
                "-e",
                "IBMCLOUD_REGION",
                "-e",
                "IBMCLOUD_RESOURCE_GROUP",
                "-e",
                "IBMCLOUD_MCP_TOOLS",
                "-e",
                "IBMCLOUD_MCP_TRANSPORT",
                "ibmcloud/climcpserver"
            ],
            "env": {
                "IBMCLOUD_API_KEY": "<Your API key>",
                "IBMCLOUD_REGION": "us-south",
                "IBMCLOUD_RESOURCE_GROUP": "default",
                "IBMCLOUD_MCP_TOOLS": "resource_groups,target,is_vpcs",
                "IBMCLOUD_MCP_TRANSPORT": "stdio"
            }
        }
    }
}
```

### 🏃🏽‍♀️ Running the Container Locally

You can run the built container image locally using the `make` targets for Podman or Docker.

Ensure you have a `.env` file in the project root. Copy `.env.example` to `.env` and set the values.

* **Running with Podman (HTTP on port 4141):**

    ```bash
    make podman-run
    ```

* **Running with Podman (HTTPS on port 4141):**

    ```bash
    make podman-run-ssl
    ```

* **Running with Docker (HTTP on port 4141):**

    ```bash
    make docker-run
    ```

* **Running with Docker (HTTPS on port 4141):**

    ```bash
    make docker-run-ssl
    ```

### ✋🏼 Stopping the Container

Stop and remove the running container instance:

* **Using Podman:**

    ```bash
    make podman-stop
    ```

* **Using Docker:**

    ```bash
    make docker-stop
    ```

### 🧪 Testing the Container

Use `curl` to quickly test the running container endpoint:

* **Using Podman:**

    ```bash
    make podman-test
    ```

* **Using Docker:**

    ```bash
    make docker-test
    ```

### 👮🏼 Security Scanning

The Makefile includes targets for scanning your `Containerfile` and built images for vulnerabilities and best practices.

* **Scan image for CVEs (HIGH/CRITICAL) using Trivy:**

    ```bash
    make trivy
    ```

* **Lint container image using Dockle:**

    ```bash
    make dockle
    ```

* **Lint Containerfile(s) using Hadolint:**

    ```bash
    make hadolint
    ```

### ☁️ Deployment to IBM Cloud Code Engine

This project includes Makefile targets to help you deploy the container image to IBM Cloud Code Engine.

1. **Configure Environment Variables:**

    Create a `.env.ce` file in the project root and define the necessary IBM Cloud Code Engine configuration variables. Copy `.env.ce.example` to `.env.ce` and set the values.

2. **Check Environment Variables:**

    ```bash
    make ibmcloud-check-env
    ```

3. **Install IBM Cloud CLI and Plugins (if needed):**

    ```bash
    make ibmcloud-cli-install
    ```

4. **Log in to IBM Cloud:**

    ```bash
    make ibmcloud-login
    ```

5. **Target Code Engine Project:**

    ```bash
    make ibmcloud-ce-login
    ```

6. **Build (if not already built) and Tag the Image:**

    ```bash
    make podman # or docker
    make ibmcloud-tag
    ```

7. **Push the Image to IBM Container Registry:**

    ```bash
    make ibmcloud-push
    ```

8. **Deploy/Update the Application in Code Engine:**

    ```bash
    make ibmcloud-deploy
    ```

9. **Stream Logs:**

    ```bash
    make ibmcloud-ce-logs
    ```

10. **Get Application Status:**

    ```bash
    make ibmcloud-ce-status
    ```

11. **Delete the Application:**

    ```bash
    make ibmcloud-ce-rm
    ```

### 🙋🏿‍♀️ Getting Help

Run the default `make` target or `make help` to see a list of all available commands and their descriptions:

```bash
make help
```

## Project Directory Structure

The repository is organized as follows:

```text
docs/                   # Website documentation
src/                    # IBM Cloud MCP Server containers
  core/                 # MCP Server for IBM Cloud core tools
  serverless/           # MCP Server container configurations for Serverless computing on IBM Cloud using Code Engine
  _MODULES_/            # MCP Server container configurations for other IBM Cloud services
```

- **docs/** is reserved for future website templates.
- **src/** contains scripts to build fit-for purpose MCP Server containers
- **src/core** contains all files related to the IBM Cloud MCP Server container, including build scripts and documentation.
- **core/.env.example** and **core/.env.ce.example** provide templates for required environment variables.
- **core/start.sh** is the script executed when the container starts.

MCP Server container configurations are provided for each each major IBM Cloud subsystem withing the `/src` directory.

## OpenAI and LLM Access

- Add `OPENAI_API_KEY` to your `.env`.  See template `.env` files in the `/src/core` directory.
- Optionally, configure [Ollama](https://ollama.com/) for local model testing.

## Running mcp-cli

1. Install `uv`: https://docs.astral.sh/uv/getting-started/installation/
2. Install [mcp-cli](https://github.com/chrishayuk/mcp-cli)
3. Setup and run `mcp-cli`: Make sure it works with one of the basic MCP server examples and an LLM provider like OpenAI
4. Edit `server_config.json` to include ibmcloud (see above examples).
5. Restart `mcp-cli`.  Type `/tools`. The IBM Cloud tools you configured should be listed.
6. Type a prompt, eg. "List resource groups" or "Target the xxx resource group".  If you have enabled `--mcp-allow-write` mode, you can try "Create a resource group named 'mcp-test'".

## 🧠 LLM Requirements & Limitations

- Only LLMs that support **tool calling** work with MCP.
- LLM context window sizes vary and can affect results, including the ability to use multiple tools within a conversation.
- Limit tools exposed to 20–30 per session. MCP injects tool metadata into LLM context.

## 🖥️ MCP Host Applications

The IBM Cloud MCP features have been used successfully with the following MCP-compliant apps. However, any MCP-compliant host application should work, but YMMV:

- VSCode
- mcp-cli
- Cline
- Claude desktop
- Vim + mcphub
- Cursor

## 🚨 Important Security Considerations 🚨

There are common security vulnerabilities which also apply when using MCP that you should mitigate appropriately. For example:

- Follow the principle of **least priviledge**:  When configuring access policies for the service identity/IBMCLOUD_API_KEY, mitigate attacks by ensuring that your agents/host applications and MCP servers can only access resources that are allowed for the agent’s responsibility and no more.

- **Zero trust**: Secure your MCP server software supply chain--only use MCP servers from trusted sources (mitigate where possible with standards like CycloneDX SBOM)

- **Secrets management**: Never place secrets in your mcp.json config file.  Use appropriate secret managers, and use .env files as intended.

- **Prevent unintended data leaks**:

  - MCP Server To/From Model: Data will flow back to LLM provider/model hosting locations.  Make sure these sites are trusted and secure.

  - MCP Server To/From other Agents: With multi-agent systems that have agents which use MCP, tasks may be delegated by LLM to other agents eg. Planner/Router/Director/Supervisor agents using A2A or ACP.  Since data is returned from MCP servers to LLM’s, LLM’s may use this data as input to further tasks that are sent to other agents.  Artifact output of your agents may be sent to other agents or humans via different channels (eg. push notifications, event streams).

  - MCP Server To/From other MCP Servers configured in the same agent or host application.  Data returned from MCP Servers gets passed back to the LLM for further processing.  The LLM may use this data as input to other MCP Servers it has access to via the host application, potentially sending the data into tools that provide access into other systems.

- **Monitor all data flows** for potential data leaks. Tools like Jaeger, OpenTelemetry and security monitors configured on your agent runtimes can be used to help detect threats.

## 🗣️ Feedback

We would love to hear your feedback on these new features through [Issues in this repo](https://github.com/IBM-Cloud/ibmcloud-mcp-server/issues).
