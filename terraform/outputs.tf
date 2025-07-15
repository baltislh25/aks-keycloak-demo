output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "ssh_public_key" {
  value = module.network.ssh_public_key
}

output "ssh_private_key" {
  value     = module.network.ssh_private_key_path
  sensitive = true
}