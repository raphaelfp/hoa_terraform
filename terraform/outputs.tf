output "database_subnets" {
  value = module.network.database_subnets
}

output "public_subnets" {
  value = module.network.public_subnets
}

output "nat_ids" {
  value = module.network.nat_ids
}

output "nat_public_ips" {
  value = module.network.nat_public_ips
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_azs" {
  value = module.network.vpc_azs
}

output "public_ip" {
  value = module.compute.public_ip
}