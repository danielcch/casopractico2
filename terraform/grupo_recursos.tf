# Creacion del grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = var.nombre_grupo_recursos
  location = var.location
  tags     = local.etiquetas_comunes
}