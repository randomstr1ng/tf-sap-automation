resource "local_file" "ssh_key" {
  content         = tls_private_key.ssh_key.private_key_openssh
  filename        = "${path.module}/ssh_key.pem"
  file_permission = "0400"
}

output "saprouter_pulic_ip" {
  description = "SAPRouter Instance Public IP"
  value = aws_eip.saprouter_eip.public_ip
}

output "saprouter_private_ip" {
  description = "SAPRouter Instance Private IP"
  value = module.saprouter.private_ip
}