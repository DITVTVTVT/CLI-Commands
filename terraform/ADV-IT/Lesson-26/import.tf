provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "node1" {
  ami                    = "ami-027951e78de46a00e"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nomad.id]
  tags = {
    Name  = "AWSLniux"
    Owner = "DIMMM"
  }
}
resource "aws_instance" "node2" {
  ami                    = "ami-0d31ac04c1d894d66"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.nomad.id]
  tags = {
    Name  = "Win2025Server"
    Owner = "DIMMM"
  }
}

resource "aws_instance" "node3" {
  ami                    = "ami-00c257e12d6828491"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nomad.id]
  tags = {
    Name  = "UbuntuLinux"
    Owner = "DIMMM"
  }
}
resource "aws_security_group" "nomad" {
  description = "launch-wizard-1 created 2025-02-26T09:43:05.378Z"
  ingress {
    from_port   = 3389
    to_port     = 3389
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
    Name = "Nomad Cluster"
    Owner = "DIMMM"
  }
}