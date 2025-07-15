terraform {
  backend "azurerm" {
    resource_group_name  = "aks-keycloak-tf-rg"
    storage_account_name = "akstfstate20889"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
