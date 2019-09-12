variable "vpc_name" {}
variable "vpc_cidr" {}
variable "public_subnets_netnum" {}
variable "database_subnets_netnum" {}
variable "environment" {}
variable "enable_nat_gateway" {}
variable "single_nat_gateway" {}

variable "instance_type" {}
variable "instance_name" {}
variable "replication_number" {}

variable "db_allocated_storage" {}
variable "db_storage_type" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_parameter_group_name" {}