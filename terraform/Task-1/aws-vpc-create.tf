# -----------------------------------------------------------
# My Terraform
#
# Build WebServer during bootstrap
#
# Made by Oleksandr Dumynskyi


resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_subnet1"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.16.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_subnet2"
  }
}

resource "aws_network_interface" "number1" {
  subnet_id   = aws_subnet.my_subnet1.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "network_interface_1"
  }
}

resource "aws_network_interface" "number2" {
  subnet_id   = aws_subnet.my_subnet2.id
  private_ips = ["172.16.16.100"]

  tags = {
    Name = "network_interface_2"
  }
}

resource "aws_instance" "my_ami_1" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.number1.id
    device_index         = 0
  }
}

resource "aws_instance" "my_ami_2" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.number2.id
    device_index         = 0
  }
}