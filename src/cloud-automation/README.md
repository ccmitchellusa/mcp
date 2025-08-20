# Cloud Automation

This project provides a Model Context Protocol (MCP) server with tools for cloud automation services on IBM Cloud including Projects, Schematics and Deployable Architectures

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

This configuration uses tools which requires the CLI plugins `project`and `schematics` to be installed.  Run the following commands to install the plugins if they are not already installed:

```bash
ibmcloud plugin install project schematics
```

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with cloud automation use cases:

- [mcp.iac.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/cloud-automation/configs/mcp.iac.json) - Tools for working with Cloud Automation, including Projects, Deployable Architectures, Private Catalogs and Schematics (Terraform/Ansible service).

Each of the above configurations also includes the following essential tools:

- `assist` - Detailed IBM Cloud Assistance "Assist me with IBMCLOUD_TOPIC..."
- `resource-groups` - Getting lists of the available resource groups
- `catalog_locations` - Getting available regions
- `target` - Change the account, resource group, region or cloud API endpoint being used as the current working context for tools.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers; however, here are some prompts that you can 
use to get started using the tools:

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other User prompts**

> _See the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) for common system prompts to use before these service-specific prompts._

The catalog ID of the community registry is 7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3
When looking for deployable architectures that are available in catalogs, ALWAYS search across all catalogs
You MUST NOT make up data values or truncate information returned from native tool calls and when summarizing data for display or displaying data values in table format.

Use the following styles:

- Display an appropriate icon for status values
- Display country flags next to geographic locations when possible.
- Use 📐 before deployable architectures
- Use 🗂️ before projects
- Use 🎚️before configurations
- Use ❄️ for frozen and / ☀️thawed states
- Use 🗂️ before workspace id’s 
- Use 🔐 for key rings


### 🤖 Cloud Automation

- 🗣️ What projects are in this account?
- 🗣️ Create a new project, "`PROJECT_NAME`" in `REGION` region and `RESOURCE_GROUP` resource group
- 🗣️ List the environments in project, "`PROJECT_NAME`".
- 🗣️ Create new "dev", "test" and "prod" environments in `PROJECT_NAME`.
- 🗣️ List the configurations in project, "`PROJECT_NAME`".
- 🗣️ List the configuration version for the configuration, `CONFIG_ID`.
- 🗣️ List all the deployable architectures in all catalogs
- 🗣️ Show me detailed deployment information for the XYZ deployable architectures in the Community Registry catalog
- 🗣️ Select the `CODE_ENGINE_PROJECT_NAME` project to work with
- 🗣️Add a configuration in the PROJECT_ID project for the VARIATION variation of the deployable architecture DA_ID.
- 🗣️Show details of the configuration `CONFIG_ID`
- 🗣️ What input values still need to be specified before I can deploy configuration `CONFIG_ID`?
- 🗣️ Validate the `CONFIG_ID` configuration.
- 🗣️ View the validation logs for `CONFIG_ID`
- 🗣️ Deploy `CONFIG_ID`
- 🗣️ Find errors in the deployment logs for project configurations.
- 🗣️ What can I try to resolve these deployment errors?

### Common Prompts

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above common commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the iac configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
