provider "aws" {
  region                  = var.aws_region
}

resource "aws_instance" "Ansible-Master" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  key_name      = "falseroses-key-Frankfurt"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "python -m pip install --user ansible",
      "mkdir /home/ec2-user/ansible",
      "mkdir /home/ec2-user/ansible/group_vars",
      "cat <<EOF > /home/ec2-user/ansible/hosts.txt",
      "[prod_servers]",
      "linux1 ansible_host=${aws_instance.Ansible-Client-1.public_ip}",
      "linux2 ansible_host=${aws_instance.Ansible-Client-2.public_ip}",
      "EOF",
      "cat <<EOF > /home/ec2-user/ansible/group_vars/prod_servers",
      "ansible_user                 : ec2-user",
      "ansible_ssh_private_key_file : /home/ec2-user/.ssh/falseroses-key-Frankfurt.pem",
      "EOF",
      "cat <<EOF > /home/ec2-user/ansible/ansible.cfg",
      "[defaults]",
      "host_key_checking = false",
      "inventory = ./hosts.txt",
      "interpreter_python = /usr/bin/python3",
      "deprecation_warnings = false",
      "EOF",
      "echo "${var.aws_private_key}" > /home/ec2-user/.ssh/falseroses-key-Frankfurt.pem",
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = var.aws_private_key
  }

  tags = {
    Name = "Ansible-Master"
  }
}

resource "aws_instance" "Ansible-Client-1" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  key_name      = "falseroses-key-Frankfurt"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "Ansible-Client-1"
  }
}

resource "aws_instance" "Ansible-Client-2" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  key_name      = "falseroses-key-Frankfurt"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "Ansible-Client-2"
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "Ansible-Infrastructure Security Group"
  description = "Ansible-Infrastructure Security Group"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name   = "my_security_group"
  }
}