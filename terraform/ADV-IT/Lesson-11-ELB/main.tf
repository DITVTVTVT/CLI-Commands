#----------------------------------------------------------
# Provision Highly Available Web in any Region Default VPC
# Create:
#    - Security Group for Web Server
#    - Launch Configuration with Auto AMI Lookup
#    - Auto Scaling Group using 2 Availability Zones
#    - Classic Load Balancer in 2 Availability Zones
#
# Made by DIMMM
#----------------------------------------------------------

provider "aws" {
  region = "eu-west-2"
}

data "aws_availability_zones" "available" {}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#----------------------------------------------------------
resource "aws_security_group" "web" {
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Terraform_DynamicSecurityGroup"
    Owner = "DIMMM"
  }
}

resource "aws_launch_template" "web" {
  name_prefix            = "WEBServer-Highly-Available-LT-"
  image_id               = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = filebase64("user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_launch_configuration" "web" {
#   name            = "WEBServer-Highly-Available-LC"
#   image_id        = data.aws_ami.latest_amazon_linux.id
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.web.id]
#   user_data       = file("user_data.sh")
#
#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_autoscaling_group" "web" {
  name = "ASG-${aws_launch_template.web.name}-v${aws_launch_template.web.latest_version}"
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  max_size            = 2
  min_size            = 2
  min_elb_capacity    = 2
  vpc_zone_identifier = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  health_check_type   = "ELB"
  load_balancers      = [aws_elb.web.name]

  dynamic "tag" {
    for_each = {
      Name   = "WebServer-in-ASG"
      Owner  = "DIMMM"
      TAGKEY = "TAGVALUE"
    }
    content {
      key                 = tag.key
      propagate_at_launch = true
      value               = tag.value
    }
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
      instance_warmup        = 0
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "web" {
  name               = "WebServer-HA-ELB"
  availability_zones = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  security_groups    = [aws_security_group.web.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "HTTP:80/"
    timeout             = 3
    unhealthy_threshold = 2
  }
  tags = {
    Name = "Server-Highly-Available-ELB"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}
#----------------------------------------------------------
output "web_loadbalancer_url" {
  value = aws_elb.web.dns_name
}
