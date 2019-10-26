output "mysql_cs" {
  value = "mysql -u ${var.username} -p -h ${aws_db_instance.web_hoa_db.address}"
}