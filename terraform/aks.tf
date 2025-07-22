# Creacion del cluster Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.nombre_aks
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.nombre_aks}-dns"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_size
  }

  identity {
    type = "SystemAssigned"
  }


  tags = local.etiquetas_comunes

  depends_on = [
    azurerm_container_registry.acr,
    azurerm_resource_group.rg
  ]
}

# Asignar permiso "AcrPull" al AKS para acceder al ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_container_registry.acr
  ]
}