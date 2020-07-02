# Azure Terraform Template

### Introduction

The goal of this template is to provide an automated way of provisioning an infrustructure to handle Dockerized applications.

Right now this template works with the following Azure resources:

- Container Registry
- App Service
- App Service Plan
- Application Insights

### How to use

Make sure that you have Terraform and Azure CLI installed on your system.

If you're a Mac user, you can install Terraform by using Homebrew command `brew install terraform`.

Once Terraform is installed, run `terraform version` to verify installation.

_Note_. The template expects that you already have an existing resource group in Azure.

Next step is to rename `terraform.tfvars.example` file to be `terraform.tfvars`. This file contains a list of credentials you need to configure before using the template.

| Value                 | Description                                                     |
| --------------------- | --------------------------------------------------------------- |
| subscription_id       | Corresponds to `id` field from `az account list` command.       |
| tenant_id             | Corresponds to `tenantId` field from `az account list` command. |
| resource_group        | Azure resource group where resources will be provisioned.       |
| acr_name              | Name for your Container Registry resource.                      |
| app_insights_name     | Name for your Application Insights resource.                    |
| app_service_name      | Name for your App Service resource.                             |
| app_service_plan_name | Name for your App Service Plan resource.                        |

Once you completed all the steps above, you're ready to provision your Azure cloud infrastructure.

First, run `terraform init` to initialize a Terraform working directory. Then run `terraform plan` to generate and see an execution plan for your resources.

Running `terraform apply` will build the specified infrastructure.

To destroy Terraform-managed infrastructure, run `terraform destroy`.

### Outputs

When your infrastructure is provisioned, run `terraform output` to see a list of values / credentials you can supply to your application or service.

| Value                             | Description                                                                                                                                                                                               |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| acr_admin_username                | Username to access Container Registry where you host your Docker images.                                                                                                                                  |
| acr_admin_password                | Password to access Container Registry where you host your Docker images.                                                                                                                                  |
| app_insights_instrumentation_key  | Instrumentation key from Application Insights to be used in your app during logging etc. This values is also exposed as environment variable in App Service with name `APP_INSIGHTS_INSTRUMENTATION_KEY`. |
| app_service_hostname              | Hostname for your App Service application.                                                                                                                                                                |
| app_service_outbound_ip_addresses | A comma separated list of outbound App Service IP addresses                                                                                                                                               |

### TODO

- [ ] Move Terraform state to remote location (e.g. Azure Blob Storage)
- [ ] Enable support for multiple environments (Terraform workspaces?)
- [ ] Provision Azure Container Instances service (as an alternative to App Service)
- [ ] Provide option to create resource group (if none exists)
