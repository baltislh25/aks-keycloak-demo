module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
  ssh_key_path        = var.ssh_key_path
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_cluster_name    = var.aks_cluster_name
  dns_prefix          = var.dns_prefix
  agent_count         = var.agent_count
  agent_vm_size       = var.agent_vm_size
  
  ssh_public_key      = module.network.ssh_public_key
  subnet_id           = module.network.subnet_id
}
module "acr" {
  source              = "./modules/container_registry"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name           = var.acr_name  # Add this line
  env                = var.env       # Add this line
}
