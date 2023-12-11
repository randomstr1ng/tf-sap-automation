# Description: This file contains the output variables for the saprouter module.
output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "saprouter_instance_id" {
  value = aws_instance.ec2_instance.id 
}