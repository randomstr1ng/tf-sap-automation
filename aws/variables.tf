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

variable "igw_name" {
  type    = string
  default = "tf-saprouter-igw"
}

variable "subnet_name" {
  type    = string
  default = "tf-saprouter-subnet"
}

# SAPRouter Module variables
variable "srt-security_group_name" {
  type    = string
  default = "tf-saprouter-sg"
}

variable "saprouter_ec2_name" {
  type    = string
  default = "tf-saprouter-vm"
}

variable "routtab-file-url" {
  type    = string
  default = "https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouttab.example"  
}

# SAPCloudConnector Module variables
variable "scc-security_group_name" {
  type    = string
  default = "tf-sapcloudconnector-sg"
}

variable "sapcloudconnector_ec2_name" {
  type    = string
  default = "tf-sapclouconnector-vm"
}

## Version information can be found here: https://tools.hana.ondemand.com/#cloud
variable "cloud-connector-version" {
  type    = string
  default = "2.16.1"
}

variable "jvm-version" {
  type    = string
  default = "	8.1.096"
  
}