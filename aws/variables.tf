variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.99.99.0/27"
}

variable "vpc_name" {
  type    = string
  default = "tf-saprouter-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.99.99.0/28"
}

variable "subnet_name" {
  type    = string
  default = "tf-saprouter-subnet"
}

variable "security_group_name" {
  type    = string
  default = "tf-saprouter-sg"
}

variable "igw_name" {
  type    = string
  default = "tf-saprouter-igw"
}

variable "ec2_name" {
  type    = string
  default = "tf-saprouter-vm"
}

variable "routtab-file-url" {
  type    = string
  default = "https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouttab.example"  
}
