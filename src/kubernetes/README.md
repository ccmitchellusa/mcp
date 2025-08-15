# Kubernetes and OpenShift

This project provides a Model Context Protocol (MCP) server with tools for kubernetes-based services on IBM Cloud including Kubernetes & OpenShift clusters.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with Kubernetes use cases:

- [mcp.ks.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/kubernetes/configs/mcp.ks.json) - Tools commonly used when working with Kubernetes and OpenShift clusters

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

Names of Locations (Regions, Zones, Datacenters) are VERY important, you MUST NOT modify the names returned from native tool calls.  
ID values MUST NOT be truncated in the output.  

When displaying information about Kubernetes, use the following styles:

- Place country flags before country codes and regions.  
- Use 🏢 before datacenter names
- Use 📍before zone names.
- Use 💠 before Clusters
- Use 👷🏻‍♂️before Workers
- Use 📡before Satellite Locations
- Use 🗳️ icon before volume id values. 
- Use 🗄️ before vpc.block types
- Use 📁 before `vpc.file`, types. 
- Place a 💠 before Cluster id values that exist and cluster name values. 
- Use an appropriate icon for status

### 📦 Clusters

- 🗣️ Show quotas grouped by Infrastructure and grouped by Type, then sort by region.and quota amount in ascending order.  
- 🗣️ List regions, and put the country’s flag before each region’s name. Don’t show flags for zones.and show the hierarchy for the countries and geographies.
- 🗣️ List storage volumes grouped by location. Only show vpc-gen2 storage devices.
- 🗣️ List my clusters
- 🗣️ Show a dashboard with the operational status of the storage volumes by geography.  Only show vpc-gen2 storage devices.
- 🗣️ List the flavors in REGION in a table. Only show flavors for the vpc-gen2 Provider.
- 🗣️ Show user messages
- 🗣️ List VPC’s for the vpc-gen2 provider. For each VPC, include the resource group and regions/zones the VPC is contained in. The resource group and region information can be found using the JSON format option on the ibmcloud_ks_vpc_ls native tool call.  Use a table format sorted first by the country that is associated with the region/zones and second by the VPC name. 

- 🚧 Work in progress 🚧

### Common

> NOTE: The above commands are from the [Core](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/README.md) set of tools and included in the code engine configuration examples above.  There are many other core commands for working with access, accounts, users, services, resource searching, etc. that can be used simply by adding the tool names to the config.

