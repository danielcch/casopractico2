# Generacion de clave SSH para la VM
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Creacion de la maquina virtual Linux
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.nombre_vm
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.nic_vm.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  computer_name = var.nombre_vm
  tags          = local.etiquetas_comunes

  depends_on = [
    azurerm_network_interface.nic_vm
  ]
}