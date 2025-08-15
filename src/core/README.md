# Core

This project provides a Model Context Protocol (MCP) server for IBM Cloud core tools.

## Install

See [Getting Started](https://ibm-cloud.github.io/mcp/overview/) for installation instructions.

## ⚙️ Configurations

The following example MCP configurations can be found in the `configs` folder to help get started with core use cases:

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

### System Prompts

> **✂️ Cut/Paste this section as a system prompt before other Cloud Automation User prompts**

#### Styling prompt for pretty display

Use the following styles when listing services in the catalog:

- Use 💰 for plans 
- Use ⚙️ for services
- Use 📍for deployments.
- Display country flags next to geographic locations when possible.
- Use ⛭ for service instances
- Use ㊮ for resource instances
- Use ⛬ before resource groups
- Use 📚 before catalogs
- Use 🏷️ before tags
- Use 📁 for account groups
- Use 🏦 for accounts
- Display 🥞for full stack Install Types
- Display 💾for software Install Types
- Display ⚙️for terraform Install Types
- Use 👔 before power workspaces
- Use 💻 before instances (power, z, x86/amd64 virtual server instances)
- Use ☁️ before “off-prem” (eg. Public cloud)
- Use 🏢 before “on-prem”
- Use 💿 before image names
- Use 🗄️ before volumes
- Use 👤 before user id’s 
- Use ⚙️ before service id’s 
- use 🔐👥 before access group names
- use 👤🔑 before user api key names and ids 
- use ⚙️🔑 before service api key names and ids 
- Use 🧑‍💼 for manager roles
- Use 🎛️ for operator roles
- Use 👨‍⚖️ for administrator roles
- Use 👁️ for viewer roles
- Use ✍️ for editor roles
- Use 👓 for reader roles
- Use ✍️for writer roles
- Use 📧 next to email id’s, within a link to mail the user.
- Use 📜🔑 next to access policy
- Display appropriate icons for state 
- Display appropriate icons for current status and health status
- When showing emails of user id’s, don’t use links
- Use appropriate icons for user state

#### Service Discovery

The ibmcloud_catalog_locations native tool is used to get the locations that services and resources can exist in IBM Cloud.  Services and their resources are deployed in a subset of these locations.  

To find services that are available in the catalog (aka “service offerings”), use the ibmcloud_catalog_search native tool, with kind=“service” and a query with the name or partial name you are looking for. The tool will provide a list of service names and id’s that match the query.
There is a special kind of service, “composite” that represents a large complex service that contains many child services within its scope.  These composite services can also be found using the same ibmcloud_catalog_search tool with kind=“composite”

To get more detailed information about an available service in the catalog, use the ibmcloud_catalog_service native tool with the service id. This tool provides details such as whether service instances can be created (provisioned) using the resource controller (RC) or whether a service-specific tool needs to be used. The plans that are available for each service, as well as deployments (the locations where the plans of the service are currently available) can also be found with this tool.

#### Service lifecycle

How service instances get created depends upon whether a service is “RC-provisionable”:
A) If RC-provisionable, use the ibmcloud_resource_service-instance-create native tool.
B) If not RC-provisionable, a service-specific specialized native tool or API for service instance creation must be used. The IBM Cloud documentation should be consulted to find the correct command to use for creating the service in this case.  Most services that are not RC-provisionable (eg. VPC services) have resources that can be created with a native tool named SERVICENAME_RESOURCENAME_create

When getting details of a service instance, make sure to use the native tool `ibmcloud_target` to set the resource group you are working in to the same resource group that the service instance is expected to be in.

#### Resource Discovery

The ibmcloud_resource_search tool searches a global and shared resource repository that is part of the IBM Cloud platform and can find cloud resources using a Lucene query.  
A resource is controlled and owned by resource providers within the IBM Cloud platform, such as IBM Cloud Kubernetes Service, or Resource Controller. 
Resources are uniquely identified by a Cloud Resource Naming identifier (CRN), and every resource must be owned by a resource group.
The properties of a resource include tags and system properties. Both properties are defined within an IBM Cloud billing account, and span across many regions.
The resource_search tool can list, query, and retrieve information about IBM Cloud resources in the user’s account, including IAM Access Groups (AG) and IAM Service IDs. 
The resource_search tool cannot retrieve resources that are:

- Users - Can be found using the account_users tool
- IAM API keys - Can be found using the iam_api-keys tool
- IAM Trusted profiles - Can be found using the iam_trusted-profiles tool
- Context Based Restrictions (CBR) Zones and Rules - Can be found using the cbr tools
- Support Cases - Can be found using case management tools
- Billing data - Can be found using account_usage tools
- Cost estimations - Can be found using cost_estimation tools
- Deployable Architectures (DA’s) - Can be found using the catalog_da_find and catalog_da_list tools

The most commonly used resource attributes (or fields) that you can query and retrieve are:

- access_tags: The list of access management tags attached to the resource.
- account_id: The billing account ID of the resource.
- catalog_tags: The list of tags determining the resource categories.
- creation_date: The date on which the resource was created in ISO format "YYYY-MM-DDTHH:mm:ss.SSSZ".
- crn: The Cloud Resource Name in the format: "crn:version:cname:ctype:service-name:location:scope:service-instance:resource-type:resource".
- modification_date: The date on which the resource was last updated in ISO format "YYYY-MM-DDTHH:mm:ss.SSSZ".
- name: The user-provided resource name.
- region: The IBM Cloud location of the resource.
- resource_group_id: The unique identifier of the resource group into which the resource is provisioned.
- service_instance: The unique identifier of the service instance.
- resource_id: The unique identifier of the resource provisioned by a service instance.
- service_name: The name of the service as it appears in the Name column of the output of ibmcloud catalog service-marketplace.
- service_tags: The list of service tags attached to the resource.
- tags: The list of user tags attached to the resource.
- type: The type of the resource.

To filter search results on resource instances, you can apply query strings using the Lucene query syntax:

- **Basic Term**: A single word is a term, and it searches for that word in all the resource attributes.Example: database searches for the word database in all the resource attributes.
- **Phrase**: A group of words surrounded by double quotes (" ") forms a phrase query, and it searches for all the words in the same order.Example: "My resource" searches for the exact phrase in all the resource attributes.
- **Field**: Specify a resource attribute for a term by prefixing it with the attribute name followed by a colon (:).Example: name:my-resource searches for resources whose attribute name is my-resource.
- **Boolean Operators**:
  - `AND` - finds resources containing both terms
  - `OR` - finds resources containing either term
  - `NOT` - excludes resources containing the term
  - Boolean operators MUST be capitalized.
  - Example: `my-resource AND database` searches for words my-resource and database in all the resource attributes.
- **Wildcards**: `*` matches any character sequence (including none), and `?` matches a single character.Example: `my-res*` finds my-resource, my-resources, etc.
- **Special characters**: Enclose in double-quotes terms containing special characters: `+ & | ! ( ) { } [ ] ^ ~ : \ /` as they are reserved in Lucene query syntax (e.g. CRNs, type-4 GUIDs). 
  - Example: name:`”Fancy!Resource&Co.”`.
- **Ranges**: Search for terms within a range and can be numeric or alphabetical.Inclusive range: `[start TO end]`, exclusive range: `{start TO end}`.Example: `creation_date:[2021-01-01 TO 2021-12-31]` finds resources whose creation_date is in the range.
- **Grouping**: Group queries with parentheses (()) to control operator precedence.Example: `(database OR containers-kubernetes) AND name:my-resource` -  Find database or container-kubernetes resources named my-resource.

Using the resources_search tool you can retrieve or list IBM Cloud resources and services using a variety of filters.Only resources that belong to the account ID and that are accessible by the client are returned.
Hereafter only some of the use cases that you can accomplish by building the right Lucene query.
To check if your backup policies are correctly configured you can use the query:

- `service_name:is AND type:backup-policy` 
  - Returns the backup policies that you are entitled to view.

- `service_name:compose-for-postgresql AND name:mydb`
  - Verify when a PostgreSQL database named mydb was created and updated by using the query and then check the creation_date and modification_date fields.

You can list resources whose name starts with either `climate_change` or `global_warming` by using the query `name:(climate_change* OR global_warming*)`.
You can retrieve resources by date, for example, those updated between 2020 and 2022 using the query `modification_date:[2020 TO 2022]`.You can use the notation `[now-X TO now]` for time relative queries:

- For "last X years" use the range `[now-Xy TO now]`
- For "last X months" use the range `[now-XM TO now]`
- For "last X weeks" use the range `[now-Xw TO now]`
- For "last X days" use the range `[now-Xd TO now]`
- For "last X hours" use the range `[now-Xh TO now]`
- For "last X minutes" use the range `[now-Xm TO now]`
- For "last X seconds" use the range `[now-Xs TO now]`

For example, the query `creation_date:[now-1w TO now]` returns the resources created in the last week.
Another interesting set of use cases is querying resources in your account by category: e.g., compute, network, storage, databases, security, devops.Suppose you want to know if there are databases in your account. You can list them using the query:`catalog_tags:databases`.
Similarly, if you want to know if there are specific services provisioned in your account you can use a query like:`service_name:(databases-for-elasticsearch OR cloudantnosqldb)`which returns instances of Elasticsearch or Cloudant databases that you are entitled to view.
Sometimes, you need to obtain the CRN of a resource given its name, or vice versa: the name of a resource given its CRN.To do so you can use the queries:`name:your-resource-name` and `crn:”your-resource-crn”`, respectively.You can use the `service_instance:your-service-instance-id or resource_id:your-resource-id` as an alternative to the CRN to retrieve the name of a resource.
Finally, you can filter resources by tags.Suppose that you are interested in resources tagged as `dev`, `test`, and `production`.You can use the queries:`tags:dev`, `tags:test`, and `tags:production`, respectively.
What if you are interested in resources provisioned with an enterprise project configuration?All resources provisioned with a project do have service tags, which can be used to get them. 
For example, the query:`service_tags:(”project::config_id:1e3bf974-0f34-4a96-960b-15823558f952” AND “project::project_id:efd46015-1902-4465-99a4-a0e12fba5759”)`returns all the resources provisioned with the specified `project_id` and `config_id`.

#### IAM

To determine what a `USER_ID` has access to:
    1. Find the access policies that the user is assigned to.
    2. Find the access groups that are available. The access group details include information like the role(s) and resources that users assigned to the access group can use.
    3. For each access group check the access group’s list of users to see if `USER_ID` is listed.
    4. Display a detailed report that provides information about what the user has access to.

To add service id’s to service id groups, the service id group must be created then set the group id on the service id either during creation or by updating the service id if it already exists.

Before trying to delete a service id group, find service id’s that reference the group using it’s group id.
If there are service id’s that reference a service id group, the service id group cannot be deleted.  
So if there is a service id that references the service id group,, 
    1. Display a list of the service id’s that are in the service id group and ask the user tor confirmation to delete all the service id’s in the group.  
    2. When all the service ids have been deleted, delete the service id group.

### User Prompts

#### Common

- 🗣️ Assist me with `IBM_CLOUD_TOPIC`
- 🗣️ What are the different parts of a CRN?
- 🗣️ Target the `RESOURCE_GROUP_NAME` resource group

#### Resource Management

- 🗣️ What resource groups are in my account?
- 🗣️ Create a new resource group named `RESOURCE_GROUP_NAME`
- 🗣️ Delete the resource group named `RESOURCE_GROUP_NAME`
- 🗣️ Search for resources using the Lucene query, `QUERY` to filter the search results.
- 🗣️ What is the RESOURCE ID id for `CRN`?
- 🗣️ What is the service type and resource type for `CRN`?
- 🗣️ List all service instances
- 🗣️ List service instances in the RESOURCE_GROUP resource group in long format.
- 🗣️ List service instances in the RESOURCE_GROUP resource group in long format. Include each service instance's Service Name in the output
- 🗣️ Create a tag, `TAG`
- 🗣️ Add the tag, `TAG` to the resource `CRN`
- 🗣️ Delete the tag, `TAG`
- 🗣️ Show me all resources with the tag, `TAG`

#### Catalog

- 🗣️ Show all services in the catalog having to do with `TOPIC`

#### Identity & Access Managment

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

#### Accounts

- 🗣️ Invite `EMAIL` to this account
- 🗣️ Disable the user `EMAIL` in this account
- 🗣️ List the users in this account
- 🗣️ What other accounts do I have access to?
- 🗣️ List all the accounts in a table
- 🗣️ List the accounts in this enterprise
- 🗣️ Show the full enterprise account hierarchy (recursively), including names of accounts within account groups, as well as the top-level     accounts in the enterprise (that are not in account groups) in a tree layout.  Include appropriate icons f
or status

#### Billing & Usage

- 🗣️ Show me a usage summary for the last month.
- 🗣️ Show me resource usage costs for the last week.
- 🗣️ Show the enterprise usage, including child account. Display the enterprise accounts and account groups with their usage for the current month. Use a table layout. Include usage costs for all account groups, recursively.

#### Identity and Access Management (IAM)

- 🗣️ Show the audit logs since YYYY-MM-DD in table format, with the columns: eventCreateDate,eventName,ipAddress,objectName,openIdConnectUserName
- 🗣️ Show the service id’s in this account in a table with columns id, name, description
- 🗣️ List the users in this account in a table with columns email, IBM ID, state 
- 🗣️ List the access policies by type (user | service_id | access_group | trusted_profile)
