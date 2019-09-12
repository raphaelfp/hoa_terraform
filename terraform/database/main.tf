resource "aws_db_subnet_group" "web_hoa_subnet_group" {
  subnet_ids = var.database_subnets
}

resource "aws_db_instance" "web_hoa_db" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.web_hoa_subnet_group.id
  vpc_security_group_ids = [aws_security_group.web_hoa_sg.id]
  skip_final_snapshot  = true
}

resource "aws_security_group" "web_hoa_sg" {
  name   = "allow internal traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}