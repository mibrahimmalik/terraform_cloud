

resource "azurerm_resource_group" "rg1" {
  name     = "tf-rg1"
  location = "uksouth"

    tags = {
        environment = "Terraform RG1"
        owner = "Muhammad Ibrahim"
    }

}

resource "azurerm_resource_group" "rg2" {
  name     = "tf-rg2"
  location = "uksouth"

    tags = {
        environment = "Terraform RG2"
        owner = "Muhammad Ibrahim"
    }
}


resource "azurerm_resource_group" "ungle_rg" {
  # Manually imported through "terraform import" command
    name     = "ungle_rg"  
    location = "uksouth"
}

resource "azurerm_virtual_network" "ungle_vnet" {
  # Manually imported through "terraform import" command
  name = "ungle_vnet"
  resource_group_name = azurerm_resource_group.ungle_rg.name
  location = "uksouth"
  address_space = ["10.2.0.0/16"]

      subnet {
        name = "default"
        address_prefix = "10.2.0.0/24"
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = "tf-vnet"
    address_space = ["10.1.0.0/16"]
    resource_group_name = azurerm_resource_group.rg1.name
    location = "uksouth"

    tags = {
        environment = "Terraform RG1"
    }

    subnet {
        name = "subnet1"
        address_prefix = "10.1.1.0/24"
    }
}


resource "azurerm_resource_group" "testing1_rg" {
  # Manually imported through "terraform import" command
    name     = "testing1_rg"  
    location = "uksouth"
}

resource "azurerm_virtual_network" "testing1_vnet1" {
  # Manually imported through "terraform import" command
  name = "testing1_vnet1"
  resource_group_name = azurerm_resource_group.testing1_rg.name
  location = azurerm_resource_group.testing1_rg.location
  
  address_space = ["10.5.0.0/16"]

      subnet {
        name = "testing1-subnet"
        address_prefix = "10.5.0.0/24"
    }
}





/*
data "azurerm_virtual_network" "mydata"{
    name = "tf-vnet"
    resource_group_name = azurerm_resource_group.rg.name

      depends_on = [
    azurerm_virtual_network.vnet,
   azurerm_resource_group.rg
  ]
}
*/