provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {
    bucket = "dimmm-project-kgb-terraform-state"
    key    = "dev/servers/terraform.tfstate"
    region = "us-east-1"
  }
}
#==============================================================================

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "dimmm-project-kgb-terraform-state"
    key    = "dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#==============================================================================
resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  user_data              = <<EOF
  #!/bin/bash
echo "-----------START-----------"
yum -y update
yum -y install htop
yum -y install httpd
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& myip=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform with Remote state!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
echo "------------STOP------------"
EOF
  tags = {
    Name = "WebServer"
  }
}

resource "aws_security_group" "webserver" {
  name   = "Webserver Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "web-server-sg"
    Owner = "DIMMM"
  }
}
