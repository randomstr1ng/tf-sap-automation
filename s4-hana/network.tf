resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = var.vpc_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_name
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    description = "SSH access"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3200
    protocol    = "tcp"
    to_port     = 3200
    description = "SAPGUI Instance 00"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3300
    protocol    = "tcp"
    to_port     = 3300
    description = "RFC Instance 00"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30213
    protocol    = "tcp"
    to_port     = 30213
    description = "SAP HANA MDC Database"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50000
    protocol    = "tcp"
    to_port     = 50000
    description = "AS ABAP HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50001
    protocol    = "tcp"
    to_port     = 50001
    description = "AS ABAP HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50013
    protocol    = "tcp"
    to_port     = 50013
    description = "SAP Start Service HTTP Instance 00"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50014
    protocol    = "tcp"
    to_port     = 50014
    description = "SAP Start Service HTTPS Instance 00"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50113
    protocol    = "tcp"
    to_port     = 50113
    description = "SAP Start Service HTTP Instance 01"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50114
    protocol    = "tcp"
    to_port     = 50114
    description = "SAP Start Service HTTPS Instance 01"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50213
    protocol    = "tcp"
    to_port     = 50213
    description = "SAP Start Service HTTP Instance 02"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50214
    protocol    = "tcp"
    to_port     = 50214
    description = "SAP Start Service HTTPS Instance 02"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Default Route Table"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_eip" "eip" {
  instance = aws_instance.ec2_instance.id
}