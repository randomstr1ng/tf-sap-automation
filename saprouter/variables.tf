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

# https://aws.amazon.com/marketplace/pp/prodview-wn2xje27ui45o
## us-east-1
variable "ec2_ami_id" {
  type    = string
  default = "ami-066a409ad14c16a1f"
}

variable "routtab-file-url" {
  type    = string
  default = "https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouttab.example"
}