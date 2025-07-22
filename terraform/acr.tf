# Creacion del Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.nombre_acr
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.sku_acr
  admin_enabled       = true
  tags                = local.etiquetas_comunes

  depends_on = [
    azurerm_resource_group.rg
  ]
}