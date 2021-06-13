# -----------------------------------------------------------
# My Terraform
#
# Build WebServer during bootstrap
#
# Made by Oleksandr Dumynskyi


provider "aws" {}

resource "aws_instance" "my_webserver" {
  ami = "ami-0bad4a5e987bdebde" # Amazon Linux AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
yum -y install git
git clone https://github.com/falseroses/falseroses.xyz
cd falseroses.xyz
cp * /var/www/html/
service httpd start
chkconfig httpd on
EOF
  tags = {
    Name = "Web Server Build by Terraform"
    Owner = "Oleksandr Dumynskyi"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "WebServer Security Group"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web Server Security Group Build by Terraform"
    Owner = "Oleksandr Dumynskyi"
  }
}