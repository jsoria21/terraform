provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "containers-web"
  location = "East US 2"
}

