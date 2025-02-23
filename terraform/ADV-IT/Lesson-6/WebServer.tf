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

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  # Убедитесь, что EIP привязывается после создания нового инстанса [ChatGPT
  depends_on = [aws_instance.my_webserver]
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-0c8db01b2e8e5298d" # Amazon Linux AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name               = "Frankfurt"
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Denis",
    l_name = "Astahov",
    names  = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha", "Katya"]
  })
  tags = {
    Name = "Terraform_AWSLinux"
  }
  lifecycle {
    # prevent_destroy = true
    # ignore_changes = ["ami", "user_data"]
    create_before_destroy = true

  }
  # Отключаем автоматическое присваивание нового публичного IP [ChatGPT
  associate_public_ip_address = false
}

resource "aws_security_group" "my_webserver" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
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
    Name = "Terraform_DynamicSecurityGroup"
  }
}

