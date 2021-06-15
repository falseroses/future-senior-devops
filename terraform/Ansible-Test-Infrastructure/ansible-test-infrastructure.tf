provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "/home/alex/future-senior-devops/terraform/terraform-credentials"
}

resource "aws_instance" "Ansible-Master" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-021b30133e9ed51f6",
  ]
  key_name      = "falseroses-key-Frankfurt"
  user_data = <<EOF
#!/bin/bash
yum -y update
echo "Starting install Ansible..."
python3 -m pip install ansible
echo "Done"
EOF
  tags = {
    Name = "Ansible-Master"
  }
}

resource "aws_instance" "Ansible-Master" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-021b30133e9ed51f6",
  ]
  key_name      = "falseroses-key-Frankfurt"
  user_data = <<EOF
#!/bin/bash
yum -y update
echo "Starting install Ansible..."
python3 -m pip install ansible
echo "Done"
EOF
  tags = {
    Name = "Ansible-Master"
  }
}

resource "aws_instance" "Ansible-Master" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-021b30133e9ed51f6",
  ]
  key_name      = "falseroses-key-Frankfurt"
  user_data = <<EOF
#!/bin/bash
yum -y update
echo "Starting install Ansible..."
python3 -m pip install ansible
echo "Done"
EOF
  tags = {
    Name = "Ansible-Master"
  }
}