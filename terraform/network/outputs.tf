output "database_subnets" {
  value = module.vpc.database_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "nat_ids" {
  value = module.vpc.nat_ids
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "vpc_azs" {
  value = module.vpc.azs
}

output "security_group_allow_http" {
  value = aws_security_group.allow_http.id
}