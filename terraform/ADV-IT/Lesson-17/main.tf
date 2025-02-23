#----------------------------------------------------------
# My Terraform
#
# Terraform Conditions and Lookups
#
# Made by DIMMM
#----------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}


data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_server" {
  ami = data.aws_ami.latest_amazon_linux.id
  # instance_type = var.env == "prod" ? "t2.large" : "t2.micro"
  instance_type = var.env == "prod" ? var.ec2_size["prod"] : var.ec2_size["dev"]
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  tags = {
    Name  = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_owner : var.noprod_owner
  }
}

resource "aws_instance" "my_dev_bastion" {
  count         = var.env == "dev" ? 1 : 0
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Bastion Server for Dev-server"
  }
}

resource "aws_instance" "my_server2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = lookup(var.ec2_size, var.env)
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name  = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_owner : var.noprod_owner
  }
}

resource "aws_security_group" "my_webserver" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = lookup(var.allow_port_list, var.env)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform_DynamicSecurityGroup"
  }
}