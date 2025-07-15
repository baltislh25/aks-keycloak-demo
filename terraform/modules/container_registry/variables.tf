variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
}

variable "sku" {
  description = "The SKU of the ACR"
  type        = string
  default     = "Basic"
}

variable "env" {
  description = "Environment tag"
  type        = string
}