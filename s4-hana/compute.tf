data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_instance" {
  instance_type          = "t3.2xlarge"
  ami                    = data.aws_ami.ubuntu.id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = aws_subnet.subnet.id
  user_data              = base64encode(templatefile("${path.module}/bootstrap.tftpl", {docker_user = var.docker_user, docker_api_key = var.docker_api_key, private_ip = aws_instance.ec2_instance.private_ip})) 

  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    volume_size = 150
  }
}