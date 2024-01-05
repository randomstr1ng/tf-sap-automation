resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_name
  vpc_id      = var.vpc-id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    protocol    = "tcp"
    to_port     = 8443
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

data "aws_ami" "opensuse-leap" {
  most_recent = true

  filter {
    name   = "name"
    values = ["openSUSE-Leap-15-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name  = "architecture"
    values = ["x86_64"]
  }

  owners = ["679593333241"]
}

resource "aws_instance" "ec2_instance" {
  # Recommended: https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance
  instance_type          = "t2.medium"
  ami                    = data.aws_ami.opensuse-leap.id
  key_name               = var.keypair-id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = var.subnet-id
  user_data              = base64encode(templatefile("${path.module}/bootstrap.tftpl", { scc-version = var.cloud-connector-version, jvm-version = var.jvm-version })) 

  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    volume_size = 20
  }
}