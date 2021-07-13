output "ansible_master_public_ip" {
  value = aws_instance.Ansible-Master.public_ip
}

output "ansible_master_private_ip" {
  value       = aws_instance.Ansible-Master.private_ip
}