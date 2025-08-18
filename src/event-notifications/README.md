# Event Notifications

This project provides a Model Context Protocol (MCP) server with tools for working with the Event Notifications service.

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with event notification use cases:

- [mcp.event-notifications.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/event-notifications/configs/mcp.event-notifications.json) - Tools for working with Event Notifications.

Each of the above configurations also includes the following essential tools:

- `assist` - Detailed IBM Cloud Assistance "Assist me with IBMCLOUD_TOPIC..."
- `resource-groups` - Getting lists of the available resource groups
- `catalog_locations` - Getting available regions
- `target` - Change the account, resource group, region or cloud API endpoint being used as the current working context for tools.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers; however, here are some prompts that you can use to get started using the tools:

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other User prompts**

> _See the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) for common system prompts to use before these service-specific prompts._

Before working with event-notifications, you need to find an event-notification service instance to work with.
Existing event-notification service instances can be listed using the `ibmcloud_resource_search` native tool using the query “event-notifications”.
Ask the user to clarify which cloud logs service instance should be used if there is more than one event notification service instance.
Determine the event notification service id to use from the CRN in the search results.
Use the event notification instance as the current service id in subsequent tool calls.

### User Prompts

- 🗣️ List destinations
- 🗣️ List topics
- 🗣️ List templates
- 🗣️ List sources

### Common Prompts

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
