output "storage_account_name"{
  value = azurerm_storage_account.example.name
}
output "vm_name"{
  value = azurerm_virtual_machine.main.name
}