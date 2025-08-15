# Cloud Internet Services

This project provides a Model Context Protocol (MCP) server with tools for the IBM Cloud Internet Services (DNS, GLB, WAF, DDoS, CDN)

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with internet services use cases:

- [mcp.cis-access.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-access.json) - Tools for working with access to Cloud Internet Services.
- [mcp.cis-alerts.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-alerts.json) - Tools for working with Alerts.
- [mcp.cis-certs.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-certs.json) - Tools for working with Certificates.
- [mcp.cis-custom-pages.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-custom-pages.json) - Tools for working with Custom Pages.
- [mcp.cis-dns.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-dns.json) - Tools for working with Domain Name Services.
- [mcp.cis-edge-func.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-edge-func.json) - Tools for working with Edge Functions.
- [mcp.cis-firewall.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-firewall.json) - Tools for working with Firewalls.
- [mcp.cis-glb.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-glb.json) - Tools for working with Global Load Balancers.
- [mcp.cis-logs.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-logs.json) - Tools for working with Cloud Internet Services Logs.
- [mcp.cis-rate-limiting.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-rate-limiting.json) - Tools for working with Rate Limiting.
- [mcp.cis-routing.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-routing.json) - Tools for working with Routing.
- [mcp.cis-waf.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cis/configs/mcp.cis-waf.json) - Tools for working with Web Application Firewalls.
-
Each of the above configurations also includes the following essential tools:

- `assist` - Detailed IBM Cloud Assistance "Assist me with IBMCLOUD_TOPIC..."
- `resource-groups` - Getting lists of the available resource groups
- `catalog_locations` - Getting available regions
- `target` - Change the account, resource group, region or cloud API endpoint being used as the current working context for tools.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers, however, here are some prompts that you can
use to get started using the tools:

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other User prompts**

> _See the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) for common system prompts to use before these service-specific prompts._

### User Prompts

- 🗣️ List CIS instances
- 🗣️ Set the current CIS context to that instance
- 🗣️ List domains
- 🗣️ Show details of that domain
- 🗣️ Show pls settings for the domain
- 🗣️ Show an overview of the domain
- 🚧 WORK IN PROGRESS 🚧

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
