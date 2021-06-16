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
  user_data = file("ansible-config.sh")
  tags = {
    Name = "Ansible-Master"
  }
}

resource "aws_instance" "Ansible-Client-1" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-021b30133e9ed51f6",
  ]
  key_name      = "falseroses-key-Frankfurt"
  tags = {
    Name = "Ansible-Client-1"
  }
}

resource "aws_instance" "Ansible-Client-2" {
  ami = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-021b30133e9ed51f6",
  ]
  key_name      = "falseroses-key-Frankfurt"
  tags = {
    Name = "Ansible-Client-2"
  }
}