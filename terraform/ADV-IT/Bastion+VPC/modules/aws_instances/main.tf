
data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.*-kernel-6.1-x86_64"]
  }
}

#===================================================================

resource "aws_launch_template" "bastion_host" {
  image_id               = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_ids]
  key_name               = var.key_name
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Bastion-Host"
    }
  }

  tags = {
    Name = "Bastion-LT"
  }
}

resource "aws_autoscaling_group" "bastion_host" {
  vpc_zone_identifier = var.public_subnets_ids
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  name                = "Bastion-ASG"

  launch_template {
    id      = aws_launch_template.bastion_host.id
    version = "$Latest"
  }

}

data "aws_instances" "bastion_instance" {
  instance_state_names = ["running"]

  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.bastion_host.name]
  }
}
