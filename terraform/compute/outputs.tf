output "public_ip" {
  value = aws_instance.web_hoa[*].public_ip
}