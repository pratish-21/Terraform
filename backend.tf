terraform {
  backend "azurerm" {
      resource_group_name  = "tfstate-terraform"
      storage_account_name = "day0417653"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
    }
}
