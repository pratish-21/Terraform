/*output "storage_account_name"{
  value = azurerm_storage_account.example.name
}*/
output "vm_name"{
  value = azurerm_virtual_machine.main.name
}
output "rg_name"{
  value = azurerm_resource_group.example[*].name
}

output "storage_name"{
  value = [for i in azurerm_storage_account.example: i.name ]
}