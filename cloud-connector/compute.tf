resource "aws_instance" "ec2_instance" {
  # Recommended: https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance
  instance_type          = "t2.medium"
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
      "wget https://tools.eu1.hana.ondemand.com/additional/sapjvm-8.1.095-linux-x64.rpm -O /tmp/sapjvm-8.1.095-linux-x64.rpm --header='Cookie: eula_3_1_agreed=tools.hana.ondemand.com/developer-license-3_1.txt'",
      "sudo rpm -i /tmp/sapjvm-8.1.095-linux-x64.rpm",
      "wget https://tools.eu1.hana.ondemand.com/additional/sapcc-${var.scc-version}-linux-x64.zip -O /tmp/sapcc-${var.scc-version}-linux-x64.zip --header='Cookie: eula_3_1_agreed=tools.hana.ondemand.com/developer-license-3_1.txt'",
      "unzip /tmp/sapcc-${var.scc-version}-linux-x64.zip -d /tmp",
      "sudo rpm -i /tmp/com.sap.scc-ui-${var.scc-version}*.rpm",
      "sudo systemctl enable scc_daemon",
      "sudo systemctl start scc_daemon",
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.ssh_key.private_key_openssh
    host        = self.public_ip
  }
}