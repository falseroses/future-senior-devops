
resource "aws_instance" "my_webserv" {
  count = 2
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  user_data = file("install-nginx.sh")
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id,
  ]

  tags = {
    Name = "my_webserv"
  }
}

resource "aws_instance" "my_redis_serv" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  user_data = file("install-redis.sh")
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id,
  ]

  tags = {
    Name = "my_redis_serv"
  }
}