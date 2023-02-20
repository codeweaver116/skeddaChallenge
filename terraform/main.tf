
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"    
      
      }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}


resource "azurerm_resource_group" "skedda_resource" {
  name     = var.resouce_group
  location = var.resource_location
}

