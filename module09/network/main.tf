terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.5"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-tfstate"
    storage_account_name = "sabetfslfmx054nqg"
    container_name       = "tfstate"
    key                  = "network.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "4832bdd9-c568-497f-af42-3c45d1e16ef6"
  features {
    
  }
}

resource "azurerm_resource_group" "network" {
  name     = "network-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "main" {
  name                = "main-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_subnet" "main" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}