provider "aws" {
  region                  = var.aws_region
}

resource "aws_instance" "my_redis_serv" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  key_name      = "falseroses-key-Frankfurt"
  subnet_id = data.aws_subnet.my_subnet.id
  vpc_security_group_ids = [data.aws_security_group.my_security_group.id]

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo amazon-linux-extras install -y redis6",
      "sudo systemctl start redis.service",
      "sudo systemctl enable redis.service",
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = var.aws_private_key
  }

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