terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate-terraform"
      storage_account_name = "day0417653"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
  }
  required_version = ">=1.12.2"
}

provider "azurerm" {
  features {
    
  }
}


resource "azurerm_resource_group" "example" {
  name     = "terraform"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "terraformpratish"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "DEV"
  }
}
