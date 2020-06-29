provider "azurerm" {
  # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
  version = "=2.16.0"

  features {}

  skip_provider_registration = true

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
