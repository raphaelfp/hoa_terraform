data "aws_ami" "ubuntu_bionic64" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "aws_keypair" {
  key_name   = "hoa"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "export_pk" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "hoa.pem"
}

resource "aws_instance" "web_hoa" {
  count                  = var.replication_number
  ami                    = data.aws_ami.ubuntu_bionic64.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.aws_keypair.key_name
  subnet_id              = element(var.public_subnets, count.index)
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data              = <<EOF
#! /bin/bash
sudo apt update
sudo apt install mysql-client-core-5.7 -y
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
public_ip="$(curl --silent http://169.254.169.254/latest/meta-data/public-ipv4)"
echo "<h1>Hi from: $public_ip</h1>" | sudo tee /var/www/html/index.html
EOF

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}
