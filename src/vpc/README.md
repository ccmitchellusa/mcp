# Virtual Private Cloud (VPC)

This project provides a Model Context Protocol (MCP) server for tools for working with VPC resources.

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

This configuration uses tools which requires the CLI plugin `vpc-infrastructure` to be installed.  Run the following commands to install the plugins if they are not already installed:

```bash
ibmcloud plugin install vpc-infrastructure
```

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with code engine use cases:

- [mcp.vpc-backup.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-backup.json) - Tools commonly used when working with backups for VPC resources
- [mcp.vpc-baremetal.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-baremetal.json) - Tools commonly used when working with bare metal servers
- [mcp.vpc-cluster.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-cluster.json) - Tools commonly used when working with VPC Cluster groups
- [mcp.vpc-instance.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-instance.json) - Tools commonly used when working with Virtual Server Instances
- [mcp.vpc-lb.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-lb.json) - Tools commonly used when working with Virtual Server load balancers
- [mcp.vpc-network.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-network.json) - Tools commonly used when working with Virtual Server network resources
- [mcp.vpc-sec.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-sec.json) - Tools commonly used when securing Virtual Private Cloud resources
- [mcp.vpc-volume.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/vpc/configs/mcp.vpc-volume.json) - Tools commonly used when working with Virtual Server storage volumes

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

### User Prompts

#### 📦 VPC

- 🗣️ List VPC's
- 🗣️ List Subnets
- 🗣️ List locations
- 🗣️ List Instances
- 🗣️ List Volumes in a table format

#### Common Prompts

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What resource groups are in my account?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

> NOTE: The above commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the code engine configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.

