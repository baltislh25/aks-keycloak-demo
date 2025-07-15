variable "resource_group_name" {}
variable "location" { default = "East US" }
variable "aks_cluster_name" {}
variable "dns_prefix" {}
variable "agent_count" { default = 2 }
variable "agent_vm_size" { default = "Standard_DS2_v2" }
variable "vnet_name" {}
variable "subnet_name" {}
variable "address_space" { default = ["10.0.0.0/16"] }
variable "subnet_prefix" { default = "10.0.1.0/24" }
variable "ssh_key_path" {}
variable "acr_name" {

  description = "The name of the Azure Container Registry"

  type        = string

}
variable "env" {

  description = "The environment for the Azure Container Registry"

  type        = string

  default     = "dev"

}