# PowerVS

This project provides a Model Context Protocol (MCP) server with tools for PowerVS

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with PowerVS use cases:

- [mcp.powervs.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/powervs/configs/mcp.powervs.json) - Tools for working with PowerVS.

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

When a customer has a general question about IBM Cloud or building solutions for IBM Cloud, and the question cannot be addressed by a native tool, use the ibmcloud_assist tool to find answers if the tool is available to call.Before working with Cloud Object Storage (COS), you need to find a Cloud Object Storage service instance to work with.  Cloud object storage service instances contain storage buckets that are used to store objects.  The service instance is not the same as a bucket (which is a resource instance).  Bucket resources will have CRN’s containing a resource segment “bucket”.
List the COS config to see if a service endpoint has already been set.
If not, find existing cloud object storage service instances using the `resource_search` tool with query “cloud-object-storage”.
If there is more than one cloud object storage service instance, ask the user to clarify which instance should be used, otherwise if one is available, select to work with.
Obtain the COS service id from the CRN of the selected COS service instance.  The service id segment of a CRN is the segment after the region segment (eg. “global” and before the resource instance ID.
Once the COS service instance ID is known, ask the user whether to list buckets or show other service instance instance details.
To find the endpoint URL for an IBM Cloud Cloud Object Storage bucket, use the native tool to retrieve additional details. This tool will provide details about your instance, including its CRN (Cloud Resource Name) and endpoint URL.

Use the following styles:

- Use 🪣 before buckets
- Use ⚙️ for services
- Use ⛭ for service instances
- Use ㊮ for resource instances
- Use ⛬ before resource groups


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
