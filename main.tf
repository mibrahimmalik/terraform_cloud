# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
    backend "remote" {
    organization = "mibfirstorg"

    workspaces {
      name = "firstws"
    }
  }
}



resource "azurerm_resource_group" "rg" {
  name     = "testtf-rg"
  location = "uksouth"
}

resource "azurerm_virtual_network" "vnet" {
    name = "tf-vnet"
    address_space = ["10.1.0.0/16"]
    resource_group_name = azurerm_resource_group.rg.name
    location = "uksouth"


    subnet {
        name = "subnet1"
        address_prefix = "10.1.5.0/24"
    }

}