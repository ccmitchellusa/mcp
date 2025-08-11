# IBMCloud MCP Server - Core

This project provides a Model Context Protocol (MCP) server for IBM Cloud core tools.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with code engine use cases:

- [mcp.all-tools.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.all-tools.json) - By not specifying an mcp-tools filter argument, *all* (1000+!) tools will be exposed to the mcp host application.  This can be useful for understanding the names.  However, the large number of tools will exceed the context window size of LLM's, so this config is only useful for debugging.
- [mcp.account.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.account.json) - Tools commonly used when working with Accounts and Users
- [mcp.catalog.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.catalog.json) - Tools for working with services and offerings in the IBM Cloud catalog.
- [mcp.assist.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.assist.json) - Tool to invoke the IBM Cloud Assistant that has been trained on all the IBM Cloud documentation to answer IBM Cloud-specific questions.
- [mcp.billing.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.billing.json) - Tools for querying billing and usage information for your accounts.
- [mcp.config.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.config.json) - Tools for adjusting common configuration settings for IBM Cloud mcp tools, such as display formats.
- [mcp.dev.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.dev.json) - Tools for working with toolchains and pipelines (tekton).
- [mcp.iam-access.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.iam-access.json) - Tools for working with Identity & Access Management (IAM) Users, Roles, Access groups and API Keys.
- [mcp.iam-policy.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.iam-policy.json) - Tools for working with Identity & Access Management (IAM) Policies.
- [mcp.iam-service.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.iam-service.json) - Tools for working with Identity & Access Management (IAM) Service Id's, Service groups and Service API Keys.
- [mcp.iam-trusted-profile.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.iam-trusted-profile.json) - Tools for working with Identity & Access Management (IAM) Trusted Profiles.
- [mcp.resource_manager.json](https://github.com/IBM-Cloud/ibmcloud-mcp-server/blob/main/src/core/configs/mcp.resource_manager.json) - Tools for with resources and resource groups, including creating service instances, account-wide resource searching, and resource quotas.

## 🗣️ Prompts

The MCP Prompt feature is not currently implemented in the IBM Cloud MCP Servers, however, here are some prompts that you can
use to get started using the core tools:

### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What are the different parts of a CRN?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

### Resource Management

- 🗣️ What resource groups are in my account?
- 🗣️ Create a new resource group named `RESOURCE_GROUP_NAME`
- 🗣️ Delete the resource group named `RESOURCE_GROUP_NAME`
- 🗣️ Search for resources using the Lucene query, `QUERY` to filter the search results.
- 🗣️ What is the RESOURCE ID id for `CRN`?
- 🗣️ What is the service type and resource type for `CRN`?
- 🗣️ List all service instances
- 🗣️ Create a tag, `TAG`
- 🗣️ Add the tag, `TAG` to the resource `CRN`
- 🗣️ Delete the tag, `TAG`
- 🗣️ Show me all resources with the tag, `TAG`

### Catalog

- 🗣️ Show all services in the catalog having to do with `TOPIC`

### Identity & Access Managment

- 🗣️ List the access groups in this account.
- 🗣️ Add `EMAIL` to `ACCESS_GROUP_NAME`
- 🗣️ Remove `EMAIL` from the `ACCESS_GROUP_NAME` access group
- 🗣️ Create a new api-key for accessing my services.
- 🗣️ Create a service id group, `name` that will be used for `purpose - Eg. Service Id's that represent Agents`.
- 🗣️ Create a service id for`SERVICE_ID` as part of the service id group `SERVICE_ID_GROUP_NAME`
- 🗣️ Create a new access group for `Reader|Writer|Manager|Viewer...` access to `SERVICE1,SERVICE2...`. Assign the `SERVICE_ID_NAME|SERVICE_ID_GROUP_NAME` to the access group.
- 🗣️ Assign `email1,email2,...` to access group `ACCESS_GROUP_NAME`
- 🗣️ Delete the service id,`SERVICE_ID`
- 🗣️ Delete the access group, `ACCESS_GROUP` name

### Accounts

- 🗣️ Invite `EMAIL` to this account
- 🗣️ Disable the user `EMAIL` in this account
- 🗣️ List the users in this account
- 🗣️ What other accounts do I have access to?

### Billing & Usage

- 🗣️ Show me a usage summary for the last month.
- 🗣️ Show me resource usage costs for the last week.
