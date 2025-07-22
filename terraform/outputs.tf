
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
