data "aws_ami" "opensuse-leap" {
  most_recent = true

  filter {
    name   = "name"
    values = ["openSUSE-Leap-15-4-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}

resource "aws_instance" "ec2_instance" {
  # Recommended: https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.opensuse-leap.id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = aws_subnet.subnet.id
  user_data              = "${file("bootstrap.sh")}" 

  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    volume_size = 20
  }
}