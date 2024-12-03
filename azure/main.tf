terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}




terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "mutaghatfstatebackend"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = "da300bc6-eed8-4b35-bce2-e0cd9cc4358d"
  tenant_id       = "4297273c-d6a5-4418-af97-4b4d165e886f"
  client_id       = "37e70e43-7b3c-4002-bc93-9d1140df3d67"
  # client_secret   = "your-client-secret" # Replace with actual secret
}

resource "azurerm_resource_group" "example" {
  name     = "tf-backend-rgg"
  location = "East US"
}
