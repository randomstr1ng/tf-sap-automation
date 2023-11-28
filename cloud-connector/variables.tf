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

# https://aws.amazon.com/marketplace/pp/prodview-wn2xje27ui45o
## us-east-1
variable "ec2_ami_id" {
  type    = string
  default = "ami-066a409ad14c16a1f"
}

variable "scc-version" {
  type = string
  default = "2.16.0"
}