output "ssh_public_key" {
  value = tls_private_key.ssh.public_key_openssh
}

output "ssh_private_key_path" {
  value = local_file.ssh_private_key.filename
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}