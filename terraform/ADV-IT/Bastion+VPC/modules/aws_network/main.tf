#----------------------------------------------------------
# Provision:
#  - VPC
#  - Internet Gateway
#  - XX Public Subnets
#  - XX Private Subnets
#  - XX NAT Gateways in Public Subnets to give access to Internet from Private Subnets
#
# Made by DIMMM
#----------------------------------------------------------

#==========================================================
data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env} VPC"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env} IGW"
  }
}
#---------------Public Subnets and Routing-----------------
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env} Public Subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "public_subnets" {
  vpc_id         = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.env} Public Route Table"
  }
}

resource "aws_route_table_association" "public_routes" {
  count = length(aws_subnet.public_subnets[*].id)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_subnets.id
}

#----------NAT gateway with Elastic IPs-------------------

resource "aws_eip" "nat" {
  count = length(var.private_subnet_cidrs)
  # vpc = true
  tags = {
    Name = "${var.env} NAT GW EIP-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat" {
  count = length(var.private_subnet_cidrs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  tags = {
    Name = "${var.env} NAT GW-${count.index + 1}"
  }
}

#-------------Private Subnets and Routing-----------------

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.env} Private Subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "private_subnets" {
  count = length(var.private_subnet_cidrs)
  vpc_id         = aws_vpc.main.id
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat[count.index].id
  }
  tags = {
    Name = "${var.env} Private Route Table-${count.index + 1}"
  }
}

resource "aws_route_table_association" "private_routes" {
  count = length(aws_subnet.private_subnets[*].id)
  subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_subnets[count.index].id
}


#-------------DB Subnets-----------------

resource "aws_subnet" "db_subnets" {
  count = length(var.db_subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.db_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.env} DB Subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "db_subnets" {
  vpc_id         = aws_vpc.main.id
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "${var.env} DB Route Table"
  }
}

resource "aws_route_table_association" "db_routes" {
  count = length(aws_subnet.db_subnets[*].id)
  subnet_id = element(aws_subnet.db_subnets[*].id, count.index)
  route_table_id = aws_route_table.db_subnets.id
}
#=============================================================