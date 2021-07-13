provider "aws" {
  region                  = "eu-central-1"
}

resource "aws_instance" "Ansible-Master" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.SSH-Anywhere.id]
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

data "aws_security_group" "SSH-Anywhere" {
  tags = {
    Name = "SSH-Anywhere"
  }
}