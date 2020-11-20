# Configure remote backend
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
    backend "remote" {
    organization = "mibfirstorg"
    hostname = "app.terraform.io"

    workspaces {
      name = "terraform_cloud"
    }
  }  
}