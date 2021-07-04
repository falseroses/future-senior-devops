provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_credentials
}


resource "aws_instance" "my_redis_serv" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.my_subnet.id
  vpc_security_group_ids = [data.aws_security_group.my_security_group.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
echo "Starting installing Redis..."
amazon-linux-extras install -y redis6
systemctl start redis.service
systemctl enable redis.service
echo "All done!"
EOF

  tags = {
    Name = "my_redis_serv"
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
