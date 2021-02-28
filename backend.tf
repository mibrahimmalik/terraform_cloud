# Configure remote backend
provider "azurerm" {
  features {}
  //version = ">= 2.26" 
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.46"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ss-rg"
    storage_account_name = "mibtfstate"
    container_name       = "tfstate"
    key                  = "demo.azure.tfstate"
    #access_key           = "fxfE8ZdtWakiaxWtVd8sIfmhNbHjaTi5c0ISS5rZprVBRfJ9sJjj/VYFPQRXFZAAARGdhD+CovITaz/JicbNkw=="
  }  
}

