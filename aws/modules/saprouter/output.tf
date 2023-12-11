# Description: This file contains the output variables for the saprouter module.
output "public_ip" {
  value = aws_eip.eip.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}