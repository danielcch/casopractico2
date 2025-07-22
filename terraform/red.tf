# Creacion de la red virtual (VNET)
resource "azurerm_virtual_network" "vnet" {
  name                = var.nombre_vnet
  address_space       = var.direccion_vnet
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.etiquetas_comunes

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Creacion de la subred
resource "azurerm_subnet" "subred" {
  name                 = var.nombre_subred
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.direccion_subred

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Creacion del grupo de seguridad de red (NSG)
resource "azurerm_network_security_group" "nsg" {
  name                = var.nombre_nsg
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.etiquetas_comunes

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Regla de seguridad: permitir SSH (puerto 22)
resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow_ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

# Regla de seguridad: permitir HTTP (puerto 80)
resource "azurerm_network_security_rule" "http" {
  name                        = "allow_http"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
