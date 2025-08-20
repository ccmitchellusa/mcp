# Serverless Computing

This project provides a Model Context Protocol (MCP) server with tools for serverless computing using Code Engine resources including Projects, Apps, Functions and Jobs.

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

This configuration uses tools which requires the CLI plugin `code-engine` to be installed.  Run the following commands to install the plugins if they are not already installed:

```bash
ibmcloud plugin install code-engine
```

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with code engine use cases:

- [mcp.code_engine_apps.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/serverless/configs/mcp.code_engine_apps.json) - Tools commonly used when working with Code Engine Applications
- [mcp.code_engine_functions.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/serverless/configs/mcp.code_engine_functions.json) - Tools commonly used when working with Code Engine Functions
- [mcp.code_engine_jobs.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/serverless/configs/mcp.code_engine_jobs.json) - Tools commonly used when working with Code Engine Jobs

Each of these configurations also includes the following essential tools:

- `project_*` - Working with Code Engine projects and setting the current Code Engine project context for code engine tools.
- `buildruns_*` - Working with Code Engine builds and logs
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

Before creating Power instances, you MUST:

1. Target an existing PowerVS Workspace.  
  1.1 If a workspace is not currently targeted, list the available workspaces. 
    1.1.2 If there are no workspaces, assist the user with creating o workspace to use. You will need the resource group, plan and workspace name.
    1.1.3 If there is one workspace, target it for future tool calls.
    1.1.4 If there are more than one workspace, ask the user to select one to target.
  1.2 If a workspace is currently targeted, list workspaces to obtain the CRN of a workspace to target
2. To find power system types (eg. s922, e980, …) that are available in a given datacenter location, list the datacenter locations and include details for each location.

### User Prompts

#### PowerVS Resources (Workspaces, Instances, Volumes, Networks)

- 🗣️ List datacenter locations
- 🗣️ List datacenter locations, including details for each location.
- 🗣️ List datacenter locations, including details for each location in a table format.
- 🗣️ Create a workspace in {{DATACENTER}}, named {{WORKSPACE_NAME}} in the {{RESOURCE_GROUP}} resource group. I want this in public cloud (eg. off-prem).
- 🗣️ Show workspace details
- 🗣️ Create a {{ public | private }} subnet with default CIDR🗣️List all available regional images [in a table format]
- 🗣️ List images [in a table format]
  - Note: this shows images for the currently targeted workspace
- 🗣️ Create an instance named {{INSTANCE_NAME}} in the {{WORKSPACE_NAME}} workspace, with the latest {{IMAGE_NAME}} operating system, and minimal cpu/memory profile attached to {{SUBNET_NAME}}
- 🗣️ List the instances in this workspace [in table format]
- 🗣️ Show details of instance {{INSTANCE_NAME}}
- 🗣️ Create a storage volume with minimum size.
- 🗣️ List volumes [in table format]
- 🗣️ Delete instances {{INSTANCE_NAME}}
- 🗣️ Delete volume {{VOLUME_NAME}}
- 🗣️ Delete subnet {{SUBNET_NAME}}
- 🗣️ Delete workspace {SUBNET_NAME}}

#### Common Prompts

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group
- 🗣️ List all code engine projects
- 🗣️ Select the `CODE_ENGINE_PROJECT_NAME` project to work with

> NOTE: The above commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the code engine configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.
