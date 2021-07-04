provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_credentials
}


resource "aws_instance" "my_backend_webserv" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.my_subnet.id
  vpc_security_group_ids = [data.aws_security_group.my_security_group.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
echo "Starting installing Nginx..."
amazon-linux-extras install -y nginx1
systemctl start nginx.service
systemctl enable nginx.service
echo "All done!"
EOF

  tags = {
    Name = "my_backend_webserv"
  }
}

data "aws_subnet" "my_subnet" {
  tags = {
    Name   = "my_subnet"
  }
}

data "aws_security_group" "my_security_group" {
  tags = {
    Name   = "my_security_group"
  }
}