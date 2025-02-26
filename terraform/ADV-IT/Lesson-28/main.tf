provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "node1" {
  ami                    = "ami-094b981da55429bfc"
  instance_type          = "t2.micro"
  tags = {
    Name  = "AWSLniux1"
    Owner = "DIMMM"
  }
}

resource "aws_instance" "node2" {
  ami                    = "ami-094b981da55429bfc"
  instance_type          = "t2.micro"
  tags = {
    Name  = "AWSLniux2"
    Owner = "DIMMM"
  }
}

resource "aws_instance" "node3" {
  ami                    = "ami-094b981da55429bfc"
  instance_type          = "t2.micro"
  depends_on = [aws_instance.node2]
  tags = {
    Name  = "AWSLniux3"
    Owner = "DIMMM"
  }
}
