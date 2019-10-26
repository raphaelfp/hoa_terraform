vpc_name                = "vpc-udti00"
vpc_cidr                = "10.0.0.0/16"
public_subnets_netnum   = [1, 2]
database_subnets_netnum = [101, 102]
environment             = "udti"
enable_nat_gateway      = true
single_nat_gateway      = true

instance_type      = "t3.micro"
instance_name      = "web_udti"
replication_number = 2

db_allocated_storage    = 20
db_storage_type         = "gp2"
db_engine               = "mysql"
db_engine_version       = "5.7"
db_instance_class       = "db.t3.micro"
db_name                 = "mydb"
db_username             = "udti"
db_password             = "senhadevesercriptografada"
db_parameter_group_name = "default.mysql5.7"