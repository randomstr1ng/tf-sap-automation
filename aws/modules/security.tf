resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_name
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3299
    protocol    = "tcp"
    to_port     = 3299
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