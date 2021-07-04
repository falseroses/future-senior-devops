output "redis_serv_public_ip" {
  value = aws_instance.my_redis_serv.public_ip
}

output "redis_serv_private_ip" {
  value       = aws_instance.my_redis_serv.private_ip
}