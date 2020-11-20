provider "azurerm" {
  features {}
 
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id

}

variable "subscription_id" {
    description = "subscription_id"
}

variable "tenant_id" {
    description = "Tenent ID"
}

variable "client_secret" {
    description = "secret value"
}

variable "client_id" {
    description = "Service Principal Application ID"
}
