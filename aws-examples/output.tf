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

output "sapcloudconnector_pulic_ip" {
  description = "SAP Cloud Connector Instance Public IP"
  value = aws_eip.sapcloudconnector_eip.public_ip
}

output "sapcloudconnector_private_ip" {
  description = "SAP Cloud Connector Instance Private IP"
  value = module.sapcloudconnector.private_ip
}

output "sapcloudconnector_pulic_ip" {
  description = "SAP S/4HANA Instance Public IP"
  value = aws_eip.sap-s4hana_eip.public_ip
}

output "sapcloudconnector_private_ip" {
  description = "SAP S/4HANA Instance Private IP"
  value = module.sap-s4hana.private_ip
}