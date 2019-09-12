output "public_ip" {
  value = aws_instance.web_hoa[*].public_ip
}

output "elb_dns" {
  value = aws_elb.web_hoa.dns_name
}

output "ssh_instance" {
  value = "ssh -i hoa.pem ubuntu@${aws_instance.web_hoa[0].public_ip}"
}