# IBMCloud MCP Server - Cloud Logs

This project provides a Model Context Protocol (MCP) server with tools for the IBM Cloud Logs service

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with cloud logs use cases:

- [mcp.logs.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cloudlogs/configs/mcp.logs.json) - Tools for working with Cloud Logs.

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

Important information for working with Cloud Logs:
Before working with Cloud Logs, you need to find a Cloud Logs service instance to work with.
Existing Cloud Logs service instances can be listed using the `resource_search` native tool using the query “logs”.
Determine the SERVICEID and REGION where the service instance resides.  
Ask the user to clarify which cloud logs service instance should be used if there is more than one Cloud Logs service instance.
Determine the service endpoint to use (try public first), and set the service url in the cloud logs configuration.
Public service endpoint URL’s for cloud logs follow this format: SERVICEID.api.REGION.logs.cloud.ibm.com
Private service endpoint URL’s for cloud logs instances follow this format: SERVICEID.api.private.REGION.logs.cloud.ibm.com
Alternatively, the service endpoint URL can be passed as an argument to individual cloud logs native tools instead of setting it in the cloud logs configuration
Use the raw output format when available by default.

When displaying information about cloud logs, use the following styles:

- Use 📜 before log names
- Use 🔔 before alert names
- Use 📁 before folder names
- Use an appropriate icon for status
- Use an appropriate icon for severity
- Use 🌎 before URLs
- Use ⚙️ before Services

### User Prompts

- 🗣️ List alerts
- 🗣️ List logs, use output type [logs-raw, logs-prettify, json] 
  - 🚨 KNOWN ISSUE: Setting output format is broken
- 🗣️ List data access rules
- 🗣️ Show cloud logs configuration
- 🗣️ List enrichments
- 🗣️ List event streams
- 🗣️ List outbound integrations
- 🗣️ Show policies
- 🗣️ List rule groups
- 🗣️ List views
- 🗣️ Create a view named NAME
- 🗣️ Show details of rule group RULEGROUP_ID

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
