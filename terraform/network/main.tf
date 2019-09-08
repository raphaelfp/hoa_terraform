data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.available.names
  private_subnets = [
    for netnum in var.private_subnet_netnum :
    cidrsubnet(var.vpc_cidr, 8, netnum)
  ]
  public_subnets = [
    for netnum in var.public_subnet_netnum :
    cidrsubnet(var.vpc_cidr, 8, netnum)
  ]

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}