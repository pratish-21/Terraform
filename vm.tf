resource "azurerm_resource_group" "example1" {
  name     = "${var.environment}-resources"
  location = var.allowed-locations[0]
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-network"
  address_space       = [element(var.network,0)]
  location            = azurerm_resource_group.example1.location
  resource_group_name = azurerm_resource_group.example1.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example1.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["${element(var.network,1)}/${element(var.network,2)}"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.environment}-nic"
  location            = azurerm_resource_group.example1.location
  resource_group_name = azurerm_resource_group.example1.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.environment}-vm"
  location              = azurerm_resource_group.example1.location
  resource_group_name   = azurerm_resource_group.example1.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.size[3]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = var.delete-disk

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.vm.publisher
    offer     = var.vm.offer
    sku       = var.vm.sku
    version   = var.vm.version
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb = var.storage-disk
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.allowed-tags["environment"]
    managed_by = var.allowed-tags["managed_by"]
    department = var.allowed-tags["department"]
  }
}