resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  https_only          = true

  app_settings = {
    "APP_INSIGHTS_INSTRUMENTATION_KEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}

output "app_service_hostname" {
  value = azurerm_app_service.app_service.default_site_hostname
}
