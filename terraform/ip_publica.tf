# Creacion de la IP publica estatica para la VM
resource "azurerm_public_ip" "ip_vm" {
  name                = var.nombre_ip_publica
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.etiquetas_comunes

  depends_on = [
    azurerm_resource_group.rg
  ]
}