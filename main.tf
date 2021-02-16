
resource "azurerm_resource_group" "rg1" {
  name     = "tf-rg1"
  location = "uksouth"

    tags = {
        environment = "Terraform RG1"
        owner = "Muhammad Ibrahim"
    }

    lifecycle {
      prevent_destroy = true
    }
}

resource "azurerm_resource_group" "rg2" {
  name     = "tf-rg2"
  location = "uksouth"

    tags = {
        environment = "Terraform RG2"
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
        environment = "Terraform RG1"
    }

    lifecycle {
      prevent_destroy = true
    }   
    subnet {
        name = "subnet1"
        address_prefix = "10.1.1.0/24"
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