# Cloud Monitoring

This project provides a Model Context Protocol (MCP) server with tools for the IBM Cloud Monitoring service

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with cloud monitoring use cases:

- [mcp.monitor.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/monitoring/configs/mcp.monitor.json) - Tools for working with Cloud Monitoring.

Each of the above configurations also includes the following essential tools:

- `assist` - Detailed IBM Cloud Assistance "Assist me with IBMCLOUD_TOPIC..."
- `resource-groups` - Getting lists of the available resource groups
- `catalog_locations` - Getting available regions
- `target` - Change the account, resource group, region or cloud API endpoint being used as the current working context for tools.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers, however, here are some prompts that you can
use to get started using the tools:

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other Cloud Automation User prompts**

> _See the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) for common system prompts to use before these service-specific prompts._

Important information for working with Cloud Montiroing:
When calling the ibmcloud_monitoring_service-instances native tool, by default, select all-resource-groups and all-regions

### User Prompts

- 🗣️ List all of the monitoring service instances
- 🚧 WORK IN PROGRESS 🚧

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
