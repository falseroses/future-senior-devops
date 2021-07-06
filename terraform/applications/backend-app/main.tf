provider "aws" {
  region                  = var.aws_region
}


resource "aws_instance" "my_backend_webserv" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  subnet_id = data.aws_subnet.my_subnet.id
  vpc_security_group_ids = [data.aws_security_group.my_security_group.id]

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx.service",
      "sudo systemctl enable nginx.service",
      "sudo yum install -y gcc-c++ make",
      "curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -",
      "sudo yum install -y nodejs",
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = tls_private_key.deployer.private_key_pem
  }

  tags = {
    Name = "my_backend_webserv"
  }
}

resource "tls_private_key" "deployer" {
  algorithm = "RSA"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.deployer.public_key_openssh
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