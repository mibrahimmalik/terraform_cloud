resource "azurerm_resource_group" "rg" {
  name     = "testtf-rg"
  location = "uksouth"

    tags = {
        environment = "dev"
        owner = "Muhammad Ibrahim"
    }

    lifecycle {
      prevent_destroy = true
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = "tf-vnet"
    address_space = ["10.1.0.0/16"]
    resource_group_name = azurerm_resource_group.rg.name
    location = "uksouth"

    tags = {
        environment = "dev"
    }

    lifecycle {
      prevent_destroy = true
    }

   
    subnet {
        name = "subnet1"
        address_prefix = var.subnet1_address_prefix
    }
    subnet {
        name = "subnet2"
        address_prefix = var.subnet2_address_prefix
    }
    subnet {
        name = "subnet3"
        address_prefix = var.subnet3_address_prefix
    }
    subnet {
        name = "subnet4"
        address_prefix = var.subnet4_address_prefix
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