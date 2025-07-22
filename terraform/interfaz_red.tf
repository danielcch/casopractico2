# Creacion de la interfaz de red (NIC) para la VM
resource "azurerm_network_interface" "nic_vm" {
  name                = var.nombre_nic
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subred.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.ip_vm.id
  }

  tags = local.etiquetas_comunes

  depends_on = [
    azurerm_subnet.subred,
    azurerm_public_ip.ip_vm,
    azurerm_network_security_group.nsg
  ]
}

# Asociacion del NSG a la subred
resource "azurerm_subnet_network_security_group_association" "subred_nsg" {
  subnet_id                 = azurerm_subnet.subred.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [
    azurerm_network_security_group.nsg,
    azurerm_subnet.subred
  ]
}