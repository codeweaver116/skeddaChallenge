
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformstateskeddadr"
    container_name       = "tfstatedr"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 0.14.9"

}
provider "azurerm" {

  skip_provider_registration = "true"
  features {}

  #Bad practice, this is for the purpose of testing and demo.

  # subscription_id = var.subscription_id
  # tenant_id       = var.tenant_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret


}


resource "azurerm_resource_group" "skedda_resource_group" {
  name     = var.resouce_group
  location = var.resource_location
}
