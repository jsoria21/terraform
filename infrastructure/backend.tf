terraform {
  backend "azurerm" {
    storage_account_name = "generalstorageamin"
    container_name       = "terraform"
    key                  = "stateActions.tfstate"
  }
}