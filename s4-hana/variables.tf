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
  default = "tf-s4hana-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.99.99.0/28"
}

variable "subnet_name" {
  type    = string
  default = "tf-s4hana-subnet"
}

variable "security_group_name" {
  type    = string
  default = "tf-s4hana-sg"
}

variable "igw_name" {
  type    = string
  default = "tf-s4hana-igw"
}

variable "ec2_name" {
  type    = string
  default = "tf-s4hana-vm"
}

locals {
  vars = {
    routtab-file-url = "https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouttab.example"
  }
}