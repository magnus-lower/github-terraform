terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate"
    storage_account_name = "sabetfs59c04d076a"
    container_name       = "tfstate"
    key                  = "project_b.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "4832bdd9-c568-497f-af42-3c45d1e16ef6"
  features {
  }
}

resource "azurerm_resource_group" "rg_b" {
  name     = var.resource_group_name
  location = var.location
}

module "storage" {
  source               = "../modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.rg_b.name
  location             = azurerm_resource_group.rg_b.location
}