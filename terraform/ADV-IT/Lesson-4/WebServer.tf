#----------------------------------------------
# My terraform
#
# Build WebServer during Bootstrap
#
# Made by DIMMM
#----------------------------------------------

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-0c8db01b2e8e5298d" # Amazon Linux AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name               = "Frankfurt"
  user_data              = templatefile("user_data.sh.tpl", { f_name = "Denis", l_name = "Astahov", names = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha"]})
  tags = {
    Name = "Terraform_AWSLinux"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
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