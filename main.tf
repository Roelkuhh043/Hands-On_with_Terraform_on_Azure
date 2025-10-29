terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "test_org_roel"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-95c3af46-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage" {
  source               = "app.terraform.io/test_org_roel/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "test_storage_account_roel"
}