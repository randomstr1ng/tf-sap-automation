variable "security_group_name" {
  type = string
  default = "saprouter_security_group"
}

variable "routtab-file-url" {
    type = string
    default = "https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouttab.example"
}

variable "ec2_name" {
  type    = string
  default = "saprouter-vm"
}

variable "vpc-id" {
  type = string
}

variable "keypair-id" {
  type = string
}

variable "subnet-id" {
  type = string
}

variable "enable_public_ip" {
  type    = bool
  default = true
}