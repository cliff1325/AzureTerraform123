terrafrom {
required_providers {
azurerm = {
source = "hasicorp/azurerm"
version = "1.1.2"


}
}


}

provider "azurerm" {
  
}

resource "azure_resource_group" "myrg" {
    name = "clifford-resource-rg"
    location = "Central US"
  
}


resource "azure_virtual_network" "myvnet" {
    name = "clifford-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = ["10.0.0.0/16"]

  
}

resource "azurerm_subnet" "mysubnet" {
  
  name = "clifford-subnet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefix= ["10.0.0.0/24"]

  

}