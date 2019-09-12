/*output "database_subnets" {
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

output "vpc_cidr" {
  value = module.network.vpc_cidr
}

output "vpc_azs" {
  value = module.network.vpc_azs
}

output "web_loha_public_ip" {
  value = module.compute.public_ip
}

output "_web_hoa_elb_dns" {
  value = module.compute.elb_dns
}

output "_mysql_cs" {
    value = module.database.mysql_cs
}

output "_ssh_instance" {
    value = module.compute.ssh_instance
}
*/
output "bucket" {
  value = module.tf_state.bucket
}

output "dynamodb_table" {
  value = module.tf_state.dynamodb_table
}
