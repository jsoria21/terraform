provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "containers-web"
  location = "East US 2"
}

resource "azurerm_service_plan" "service_plan" {
  name                = "webapp-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "coffeshop"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.rg.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    always_on = true
    linux_fx_version = "DOCKER|${var.container_image}"
  }
}