/*
resource "azurerm_storage_account" "example" {
  count = length(var.sname)
  name                     = var.sname[count.index]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = local.common_tags.stage
  }
}*/


resource "azurerm_storage_account" "example" {
  foreach = var.sname
  name                     = var.sname[each.value]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = local.common_tags.stage
  }
}

