provider "aws" {
  region = "us-east-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source                = "./network"
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  private_subnet_netnum = var.private_subnet_netnum
  public_subnet_netnum  = var.public_subnet_netnum
  environment           = var.environment
  enable_nat_gateway    = var.enable_nat_gateway
  enable_vpn_gateway    = var.enable_vpn_gateway
} 