# Generate SSH Key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "tf-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

module "saprouter" {
  source = "./modules/saprouter"

  security_group_name = var.security_group_name
  routtab-file-url    = var.routtab-file-url
  ec2_name            = var.ec2_name
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
}