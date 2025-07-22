terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.99"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  # Toma el contexto actual de az login
  # No requiere client_id, client_secret ni tenant_id
}