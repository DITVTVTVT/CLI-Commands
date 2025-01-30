terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-06e54d05255faf8f6"
  instance_type = "t3.micro"

  tags = {
    Name  = "My-Ubuntu-Server"
    Owner = "Dmitry Safronov"
  }
}