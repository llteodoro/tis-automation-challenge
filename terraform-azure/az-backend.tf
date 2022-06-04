terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg-1"
    storage_account_name = "tisautomationchallenge"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}