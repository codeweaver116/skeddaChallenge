provider "azurerm" {
      version = "~> 2.3.0"

}

resource "azurerm_resource_group" "skedda_resource" {
  name     = var.resouce_group
  location = var.resource_location
}

