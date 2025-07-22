terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0" # ultima version estable (ajusta si hay nueva)
    }
  }
}

provider "azurerm" {
  features {}

  # Toma el contexto actual de az login
  # No requiere client_id, client_secret ni tenant_id
}