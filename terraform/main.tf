
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"

    }
  }
   backend "azurerm" {
        resource_group_name  = "mm"
        storage_account_name = "terraformstate2343"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
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

data "azurerm_service_plan" "skedda_app_service_plan" {

  name                = var.skedda_app_service_plan
  resource_group_name = data.azurerm_resource_group.skedda_resource.name

}
