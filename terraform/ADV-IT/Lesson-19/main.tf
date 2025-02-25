#----------------------------------------------------------
# My Terraform
#
# Provision Resources in Multiply AWS Regions / Accounts
#
# Made by DIMMM
#----------------------------------------------------------

provider "aws" {
  region = "ca-central-1"
  # access_key = "xxxxxxxxxxxxxx"
  # secret_key = "yyyyyyyyyyyyyyyyyyyyyyy"
  #     or
  # assume_role {
  #   role_arn = "arn:aws:iam::1234567890:role/RemoteAdministrators"
  #   session_name = "TERRAFORM_SESSION"
  # }
}

provider "aws" {
  region = "us-east-1"
  alias = "USA"
}

provider "aws" {
  region = "eu-central-1"
  alias = "GER"
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

resource "aws_instance" "my_default_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  tags = {
    Name = "Default Server"
  }
}

data "aws_ami" "latest_usa_amazon_linux" {
  provider = aws.USA
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_usa_server" {
  provider = aws.USA
  ami           = data.aws_ami.latest_usa_amazon_linux.id
  instance_type = "t3.micro"
  tags = {
    Name = "USA Server"
  }
}

data "aws_ami" "latest_ger_amazon_linux" {
  provider = aws.GER
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_ger_server" {
  provider = aws.GER
  ami           = data.aws_ami.latest_ger_amazon_linux.id
  instance_type = "t3.micro"
  tags = {
    Name = "GERMANY Server"
  }
}