
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
        storage_account_name = "terraformstateskedda"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

  required_version = ">= 0.14.9"

}
provider "azurerm" {

  skip_provider_registration = "true"
  features {}

  subscription_id   = "b29e0319-fc3e-4a92-a329-2f42a6b55708"  #Bad practice, this is for the purpose of testing and demo.
  tenant_id         = "8af79369-0252-4816-893a-d143b54885e3"
  client_id         = "e86f1bfa-58b0-47f2-9dac-6f61de199e08"
  client_secret     = "gw88Q~N1Udw_fEEkpneMtwb3idoZhkK2bnywWbMP"

  
}


resource "azurerm_resource_group" "skedda_resource_group" {
  name     = var.resouce_group
  location = var.resource_location
}
