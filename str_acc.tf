/*
resource "azurerm_storage_account" "example" {
  count = length(var.sname)
  name                     = var.sname[count.index]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.stage
  }
}*/


resource "azurerm_storage_account" "example" {
  for_each = var.sname
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.stage
  }
  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
    ignore_changes = [account_replication_type]
    #replace_triggered_by = [ azurerm_storage_account.example.id ]
    precondition {
      condition = contains(var.allowed-locations, var.location)
      error_message = "please enter a valid loaction"
    }
  }
}

