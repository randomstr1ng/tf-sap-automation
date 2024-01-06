# Generate SSH Key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "tf-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Create SAPRouter
module "saprouter" {
  source = "../aws-modules/saprouter"

  security_group_name = var.srt-security_group_name
  routtab-file-url    = var.routtab-file-url
  ec2_name            = var.saprouter_ec2_name
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
}
resource "aws_eip" "saprouter_eip" {
  instance = module.saprouter.saprouter_instance_id
}

# Create SAP Cloud Connectors
module "sapcloudconnector" {
  source = "../aws-modules/sap-cloud-connector"

  security_group_name = var.scc-security_group_name
  ec2_name            = var.sapcloudconnector_ec2_name
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
  cloud-connector-version         = var.cloud-connector-version
  jvm-version         = var.jvm-version
}
resource "aws_eip" "sapcloudconnector_eip" {
  instance = module.sapcloudconnector.sapcloudconnector_instance_id
}

# Create SAP S4/HANA 1909 ABAP Platform Trial
module "sap-s4hana" {
  source = "../aws-modules/s4-hana"

  security_group_name = var.s4_hana_security_group_name
  ec2_name            = var.s4_hana_ec2_name
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
}
resource "aws_eip" "sap-s4hana_eip" {
  instance = module.sap-s4hana.sapcloudconnector_instance_id
}