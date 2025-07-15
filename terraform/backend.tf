terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform-backend"
    storage_account_name  = "tfstatebaltisalah"
    container_name        = "tfstate"
    key                   = "aks-keycloak-demo.tfstate"
  }
}
