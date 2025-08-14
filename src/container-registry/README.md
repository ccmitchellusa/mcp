# Container Registry

This project provides a Model Context Protocol (MCP) server with tools for working with the container registry service on IBM Cloud including Namespaces and Images

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with container registry use cases:

- [mcp.cr.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/container-registry/configs/mcp.cr.json) - Tools for working with Container Registry.

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

You must not show your thinking, unless requested by the user.
When displaying information about container registry, use the following styles:

- Use 💿 before image names
- Use 🗑️ before trash
- Use 🆔before digests
- Use 🏷️ before tags
- Use 🧾 before plans
- Use 📇 before namespace names
- Use 📜 before manifest names
- Use 🛡️before issue types
- Use 📏 before sizes
- Use 📅 before dates
- Use 📇 before digests
- Use 📽️ before media types
- Use 📐 before schemas
- Display an appropriate icon for status
- Use country’s flag before each region’s name and place a corporate building icon before datacenter names, and a round pushpin icon before zone names when listing locations like regions.
- Don’t show flags for zones, and show the hierarchy for the countries and geographies. Show 🌎for the `global` location.
- NEVER modify or truncate ID or Name values

### 🤖 Cloud Automation

- 🗣️ Login to podman
- 🗣️ List images
- 🗣️ List namespaces
- 🗣️ List exceptions
- 🗣️ List issue type
- 🗣️ Show me the details of issue ISSUE-NAME
- 🗣️ List retention policies
- 🗣️ Show trash items
- 🗣️ Set the current container registry region to REGION
- 🗣️ Show vulnerability report for IMAGE_NAME.
- 🗣️ Show vulnerability report for IMAGE_NAME.  Include suggestions for remediation actions.

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
