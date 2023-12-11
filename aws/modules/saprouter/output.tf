# variable "instance-id" {
#   type    = string
#   default = aws_instance.ec2_instance.id
# }
output "public_ip" {
  value = aws_eip.eip.public_ip
}