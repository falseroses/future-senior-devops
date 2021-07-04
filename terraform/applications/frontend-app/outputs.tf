output "frontend_webserv_public_ip" {
  value = aws_instance.my_frontend_webserv.public_ip
}

output "frontend_webserv_private_ip" {
  value = aws_instance.my_frontend_webserv.private_ip
}