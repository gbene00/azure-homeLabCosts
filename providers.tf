terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"      
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "terraformstatesa1"
    container_name       = "terraform-state"
    key                  = "resource-costs-terraform.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "da045766-61df-4298-9cac-effd16671de9"
}
