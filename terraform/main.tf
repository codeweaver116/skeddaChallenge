
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


data "azurerm_resource_group" "skedda_resource" {
  name = var.resouce_group
}

data "azurerm_app_service" "skedda_app_service_plan" {
  name                = "ASP-mm-8221"
  resource_group_name = data.azurerm_resource_group.skedda_resource.name
}