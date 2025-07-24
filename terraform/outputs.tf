# acr_login_server: Dirección del servidor de login del Azure Container Registry (ACR)
output "acr_login_server" {
  description = "Dirección del servidor de login del Azure Container Registry (ACR)."
  value       = azurerm_container_registry.acr.login_server
}

# Nombre de usuario administrador del ACR
output "acr_admin_username" {
  description = "Nombre de usuario administrador del ACR."
  value       = azurerm_container_registry.acr.admin_username
}

# Contraseña del usuario administrador del ACR
output "acr_admin_password" {
  description = "Contraseña del usuario administrador del ACR. Este valor es sensible."
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}

# Nombre de usuario administrador de la VM
output "vm_admin_username" {
  description = "Nombre de usuario administrador de la maquina virtual"
  value       = azurerm_linux_virtual_machine.vm.admin_username
}

# Contraseña del usuario administrador de la VM
output "vm_admin_password" {
  description = "Contraseña del usuario administrador de la maquina virtual. Este valor es sensible."
  value       = azurerm_linux_virtual_machine.vm.admin_password
  sensitive   = true
}

# IP publica de la VM
output "ip_publica_vm" {
  description = "Direccion IP publica de la maquina virtual"
  value       = azurerm_public_ip.ip_vm.ip_address
}

# IP privada estatica de la VM
output "ip_privada_vm" {
  description = "Direccion IP privada estatica de la maquina virtual"
  value       = azurerm_network_interface.nic_vm.private_ip_address
}

# Clave privada SSH generada para la VM
output "ssh_private_key" {
  description = "Clave privada SSH generada para la VM"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

# Clave publica SSH generada para la VM
output "ssh_public_key" {
  description = "Clave publica SSH generada para la VM"
  value       = tls_private_key.ssh_key.public_key_openssh
}

# Resource Group del AKS
output "aks_resource_group" {
  description = "Resource group donde se despliega AKS"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}

# Nombre del AKS
output "aks_cluster_name" {
  description = "Nombre del cluster AKS"
  value       = azurerm_kubernetes_cluster.aks.name
}

# Kubeconfig del AKS (para que Ansible lo use)
output "aks_kubeconfig" {
  description = "Kubeconfig generado para conectarse al AKS"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
