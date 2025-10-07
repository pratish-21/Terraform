resource "azurerm_resource_group" "example" {
    lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }
  name     = "terraform"
  location = "West Europe"
  tags = {
    environment = var.environment

  }
}