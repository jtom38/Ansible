
provider "azurerm" {
	version = "=1.20.0"
}

resource "azurerm_resource_group" "rg" {
	name 			= "myTFResourceGroup"
	location	= "eastus"

	tags {
		envirement	= "TF Sandbox"
	}
}

resource "azurerm_virtual_network" "vnet" {
	name	= "myTFnet"
	address_space	= ["10.0.0.0/16"]
	location	=	 "eastus"
	resource_group_name	= "${azurerm_resource_group.rn.name}"
}
