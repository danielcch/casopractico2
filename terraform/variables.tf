# Region donde se desplegaran los recursos
variable "location" {
  type        = string
  description = "Region de Azure donde se desplegaran los recursos"
  default     = "westeurope"
}

# Nombre del grupo de recursos
variable "nombre_grupo_recursos" {
  type        = string
  description = "Nombre del grupo de recursos principal de Azure"
  default     = "unircp2"
}

# Nombre y configuracion de la red virtual (VNET)
variable "nombre_vnet" {
  type        = string
  description = "Nombre de la red virtual (VNET)"
  default     = "cp2-vnet"
}

variable "direccion_vnet" {
  type        = list(string)
  description = "Rango de direcciones IP para la VNET"
  default     = ["10.0.0.0/16"]
}

# Nombre y configuracion de la subred
variable "nombre_subred" {
  type        = string
  description = "Nombre de la subred dentro de la VNET"
  default     = "cp2-subred"
}

variable "direccion_subred" {
  type        = list(string)
  description = "Rango de direcciones IP para la subred"
  default     = ["10.0.1.0/24"]
}

# Nombre del grupo de seguridad de red (NSG)
variable "nombre_nsg" {
  type        = string
  description = "Nombre del grupo de seguridad de red (NSG)"
  default     = "cp2-nsg"
}

# Configuracion de la IP publica para la VM
variable "nombre_ip_publica" {
  type        = string
  description = "Nombre de la IP publica para la maquina virtual"
  default     = "cp2-ip-publica-vm"
}

# Configuracion de la interfaz de red para la VM
variable "nombre_nic" {
  type        = string
  description = "Nombre de la interfaz de red para la maquina virtual"
  default     = "cp2-nic-vm"
}

# Configuracion de la maquina virtual
variable "nombre_vm" {
  type        = string
  description = "Nombre de la maquina virtual"
  default     = "cp2-vm"
}

variable "vm_size" {
  type        = string
  description = "Tamaño de la maquina virtual en Azure (low cost)"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Nombre de usuario administrador para la maquina virtual"
  default     = "adminuser"
}

# Configuracion del Azure Container Registry (ACR)
variable "nombre_acr" {
  type        = string
  description = "Nombre del Azure Container Registry"
  default     = "cp2AcrDcch"
}

variable "sku_acr" {
  type        = string
  description = "SKU del Azure Container Registry"
  default     = "Basic"
}

# Configuracion del cluster AKS
variable "nombre_aks" {
  type        = string
  description = "Nombre del cluster Azure Kubernetes Service"
  default     = "cp2-aks-dcch"
}

variable "aks_node_count" {
  type        = number
  description = "Numero de nodos en el cluster AKS (1 para low cost)"
  default     = 1
}

variable "aks_node_size" {
  type        = string
  description = "Tamaño de los nodos del cluster AKS (low cost)"
  default     = "Standard_B2s"
}

# Etiquetas comunes para los recursos
variable "etiquetas" {
  type        = map(string)
  description = "Mapa de etiquetas comunes para todos los recursos"
  default = {
    Proyecto    = "CP2"
    Owner       = "daniel"
    Environment = "casopractico2"
  }
}