# Event Streams

This project provides a Model Context Protocol (MCP) server with tools for working with the Event Streams service.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with event streams use cases:

- [mcp.event-streams.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/event-streams/configs/mcp.event-streams.json) - Tools for working with Event Streams.

Each of the above configurations also includes the following essential tools:

- `assist` - Detailed IBM Cloud Assistance "Assist me with IBMCLOUD_TOPIC..."
- `resource-groups` - Getting lists of the available resource groups
- `catalog_locations` - Getting available regions
- `target` - Change the account, resource group, region or cloud API endpoint being used as the current working context for tools.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers, however, here are some prompts that you can use to get started using the tools:

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other Cloud Automation User prompts**

> _See the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) for common system prompts to use before these service-specific prompts._

Before working with event streams resources, an event streams instance must be selected to work with usingg the native tool ibmcloud_es_init
When displaying information about event streams:

- Use 💬for topics
- Use 📐for schemas
- Use 👥for groups
- Use 🤝for brokers
- Use 🌐 for event stream clusters
- Use 🔄 for mirrored topics

### User Prompts

- 🗣️ Search the catalog for event stream service, and then show details of the event streams service.
- 🗣️ Find event streams resource instances
- 🗣️ Create a new instances of event streams service using the [Lite | Standard | Enterprise] plan in REGION
- 🗣️ Show details of the event streams instance [NAME | ID]
- 🗣️ Show details of the event streams cluster
- 🗣️ Create a new topic, “TOPIC_NAME”
- 🗣️ List topics
- 🗣️ Delete the TOPIC_NAME topic
- 🗣️ Delete records from TOPIC_NAME
- 🗣️ Show details of the topic TOPIC_NAME
- 🗣️ List consumer groups
- 🗣️ Create a consumer group named GROUP_NAME
- 🗣️ Delete the consumer group named GROUP_NAME
- 🗣️ List mirrored topics
- 🗣️ Set TOPIC_NAME to be mirrored
- 🗣️ List schemas
- 🗣️ Create a schema with artifact id ARTIFACT_NAME with the following structure: ‘{"type": "record","name": "UserSignupEvent","namespace": "com.example.events","fields": [{ "name": "userId", "type": "string" },{ "name": "email", "type": "string" },{ "name": "signupTimestamp", "type": "long" },{ "name": "source", "type": ["null", "string"], "default": null }]}’
- 🗣️ List schema ARTIFACT_NAME
- 🗣️ Create a new version of ARTIFACT_MAME from structure: ‘{"type": "record","name": "UserSignupEventv2”,”namespace": "com.eg.events","fields": [{ "name": "userId", "type": "string" },{ "name": "email", "type": "string" },{ "name": "signupTimestamp", "type": "long" },{ "name": "source", "type": ["null", "string"], "default": null }]}’
- 🗣️ List schema versions for ARTIFACT_NAME
- 🗣️ Delete schema version VERSION of ARTIFACT_MAME

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
