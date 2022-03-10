# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "2043f2c0-054a-483b-9b5f-1b7eeb3eebaa"
    client_id = "6db31312-60b0-4480-bd6c-a73b6bb39598" # appID
    client_secret = "FzG05kfJOdZJvqe47u.J4HFa4_r._RADn~" # password
    tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}

# Resource Group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
    name     =  var.resource_group_name
    location = var.location
    tags = {
        environment = "P2"
    }
}

# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "stAccount" {
    name                     = "aclstaccount"
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
        environment = "P2"
    }
}