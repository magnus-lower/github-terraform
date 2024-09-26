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
    key                  = "web-demo.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "4832bdd9-c568-497f-af42-3c45d1e16ef6"
  features {
  }
}