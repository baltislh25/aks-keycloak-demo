
output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "The admin username for ACR"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "The admin password for ACR"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}