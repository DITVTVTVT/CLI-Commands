provider "aws" {
  region = "eu-central-1"
}

# module "vpc_default" {
#   # source              = "../modules/aws_network"
#  source = "git@github.com:DITVTVTVT/terraform-modules.git//aws_network"
# }

module "vpc_dev" {
  # source              = "../modules/aws_network"
  source = "git@github.com:DITVTVTVT/terraform-modules.git//aws_network"
  env                 = "dev"
  vpc_cidr            = "192.0.0.0/16"
  public_subnet_cidrs = ["192.0.30.0/24", "192.0.31.0/24"]
  private_subnet_cidrs = []
}

# module "vpc_prod" {
#   # source              = "../modules/aws_network"
#   source = "git@github.com:DITVTVTVT/terraform-modules.git//aws_network"
#   env                 = "prod"
#   vpc_cidr            = "10.10.0.0/16"
#   public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24","10.10.33.0/24"]
# }
#
# module "vpc_test" {
#   # source              = "../modules/aws_network"
#   source = "git@github.com:DITVTVTVT/terraform-modules.git//aws_network"
#   env                 = "staging"
#   vpc_cidr            = "10.10.0.0/16"
#   public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24"]
# }
#
# module "security_group" {
#   source = "git@github.com:DITVTVTVT/terraform-modules.git//aws_securitygroup"
#   env = "dev"
#
# }
# #==========================================================
# output "prod_public_subnet_ids" {
#   value = module.vpc_prod.public_subnet_ids
# }
#
# output "prod_private_subnet_ids" {
#   value = module.vpc_prod.private_subnet_ids
# }


output "dev_public_subnet_ids" {
  value = module.vpc_dev.public_subnet_ids
}

output "dev_development_subnet_ids" {
  value = module.vpc_dev.private_subnet_ids
}