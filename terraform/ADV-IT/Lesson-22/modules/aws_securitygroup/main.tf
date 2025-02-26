# Future Terraform Module :)
#
# Do it yourself! Or with ChatGPT;)
#----------------------------------------------
resource "aws_security_group" "custom_sg" {
  name        = "custom-sg"
  description = "Security Group with dynamic ports and CIDR blocks"
  vpc_id      = var.vpc_id  # связываем Security Group с VPC

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.port_cidr_map
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}