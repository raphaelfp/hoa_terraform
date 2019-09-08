provider "aws" {
  region = "us-east-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source                  = "./network"
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  public_subnets_netnum   = var.public_subnets_netnum
  database_subnets_netnum = var.database_subnets_netnum
  environment             = var.environment
  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
} 