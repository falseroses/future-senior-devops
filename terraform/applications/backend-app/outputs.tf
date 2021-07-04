output "backend_webserv_public_ip" {
  value = aws_instance.my_backend_webserv.public_ip
}

output "backend_webserv_private_ip" {
  value = aws_instance.my_backend_webserv.private_ip
}