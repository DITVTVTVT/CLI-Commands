provider "aws" {
  region = "eu-central-1"
}

module "vpc_prod" {
  source               = "../modules/aws_network"
  env                  = "KGB Network"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.11.0/24", "10.0.21.0/24"]
  private_subnet_cidrs = ["10.0.12.0/24", "10.0.22.0/24"]
  db_subnet_cidrs      = ["10.0.13.0/24", "10.0.23.0/24"]
}

module "security_group" {
  source = "../modules/aws_securitygroup"
  vpc_id = module.vpc_prod.vpc_id
  env    = "KGB Network"
  port_cidr_map = {
    # "http" = {
    #   port       = 80
    #   cidr_block = "0.0.0.0/0"
    # }
    # "mysql" = {
    #   port       = 3306
    #   cidr_block = "10.0.0.0/16"
    # }
    "ssh" = {
      port       = 22
      cidr_block = "0.0.0.0/0"
    }
  }
}

module "bastion_instance" {
  source             = "../modules/aws_instances"
  instance_type      = "t2.micro"
  key_name           = "Frankfurt"
  security_group_ids = module.security_group.security_group_id
  public_subnets_ids = module.vpc_prod.public_subnet_ids

}
# #==========================================================
output "prod_public_subnet_ids" {
  value = module.vpc_prod.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc_prod.private_subnet_ids
}

output "bastion_public_ip" {
  value = module.bastion_instance.bastion_public_ip
}
