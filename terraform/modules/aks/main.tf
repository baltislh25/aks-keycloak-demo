# AKS cluster definition
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

default_node_pool {
  name                = "default"
  min_count = 1
  max_count = 3
  vm_size             = var.agent_vm_size
  vnet_subnet_id      = var.subnet_id
  auto_scaling_enabled = true
}

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = "10.200.0.0/16"      # <- far away from 10.0.1.0/24
    dns_service_ip     = "10.200.0.10"
    
  }

  # rbac_enabled = true

  tags = {
    Environment = "Dev"
  }
}