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
  default = "tf-sapcc-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.99.99.0/28"
}

variable "subnet_name" {
  type    = string
  default = "tf-sapcc-subnet"
}

variable "security_group_name" {
  type    = string
  default = "tf-sapcc-sg"
}

variable "igw_name" {
  type    = string
  default = "tf-sapcc-igw"
}

variable "ec2_name" {
  type    = string
  default = "tf-sapcc-vm"
}

locals {
  vars = {
    scc-version = "2.16.1"
  }
}