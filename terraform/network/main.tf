data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.available.names
  public_subnets = [
    for netnum in var.public_subnets_netnum :
    cidrsubnet(var.vpc_cidr, 8, netnum)
  ]
  database_subnets = [
    for netnum in var.database_subnets_netnum :
    cidrsubnet(var.vpc_cidr, 8, netnum)
  ]

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = true

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    Terraform   = "true"
  }
}