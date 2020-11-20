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
        address_prefix = var.subnet1_address_prefix
    }

    subnet {
        name = "subnet2"
        address_prefix = var.subnet2_address_prefix
    }

}