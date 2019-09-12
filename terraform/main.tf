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

module "compute" {
  source             = "./compute"
  instance_type      = var.instance_type
  instance_name      = var.instance_name
  replication_number = var.replication_number
  public_subnets     = module.network.public_subnets
  vpc_id             = module.network.vpc_id
  security_group     = module.network.security_group_allow_http
  environment        = var.environment
}

module "database" {
  source               = "./database"
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.db_parameter_group_name
  database_subnets     = module.network.database_subnets
  vpc_id               = module.network.vpc_id
  vpc_cidr             = module.network.vpc_cidr
}