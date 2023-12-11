variable "cloud-connector-version" {
  type = string
  default = "2.12.1"
}

variable "jvm-version" {
  type = string
  default = "11"
}

variable "security_group_name" {
  type = string
  default = "sapcloudconnector_security_group"
}

variable "ec2_name" {
  type    = string
  default = "sapcloudconnector-vm"
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