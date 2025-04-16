#----------------------------------------------
# Terraform -> OpenTofu
# Build WebServer on AWS EC2 during Bootstrap
#
# 1. terraform init
# 2. terraform apply
# 3. tofu init
# 4. tofu apply
#
# Copyleft (c) by DIMMM 2025
#----------------------------------------------


provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "web" {
  ami                         = "ami-05b10e08d247fb927"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.web.id]
  user_data_replace_on_change = true
  user_data                   = <<EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl start nginx
systemctl enable nginx
EOF

  tags = {
    Name  = "WebServer Build by Tofu/Terraform" # Tag the instance with a Name tag for easier identification
    Owner = "DIMMM"
  }
}

resource "aws_security_group" "web" {
  name        = "WebServer-SG"
  description = "Security Group for my WebServer"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform_SecurityGroup"
  }
}

output "ip" {
  value = aws_instance.web.public_ip
}

