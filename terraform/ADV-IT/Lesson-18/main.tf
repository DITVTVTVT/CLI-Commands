#----------------------------------------------------------
# My Terraform
#
# Terraform Loops: Count and For if
#
# Made by DIMMM
#----------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "user1" {
  name = "pushkin"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = var.aws_users[count.index]
  # name = element(var.aws_users, count.index)
}
#----------------------------------------------------------
data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "servers" {
  count         = 3
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}
#----------------------------------------------------------
