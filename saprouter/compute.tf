resource "aws_instance" "ec2_instance" {
  # Recommended: https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance
  instance_type          = "t2.micro"
  ami                    = var.ec2_ami_id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = aws_subnet.subnet.id

  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    volume_size = 20
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /opt/saprouter/",
      "sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouter -O /opt/saprouter/saprouter",
      "sudo chmod +x /opt/saprouter/saprouter",
      "sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/niping -O /opt/saprouter/niping",
      "sudo chmod +x /opt/saprouter/niping",
      "sudo wget https://raw.githubusercontent.com/randomstr1ng/static-files/master/saprouter_linux/saprouter.service -O /etc/systemd/system/saprouter.service",
      "sudo wget ${var.routtab-file-url} -O /opt/saprouter/saprouttab",
      "sudo chown -R root:root /opt/saprouter/",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable saprouter.service",
      "sudo systemctl start saprouter.service",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.ssh_key.private_key_openssh
    host        = self.public_ip
  }
}