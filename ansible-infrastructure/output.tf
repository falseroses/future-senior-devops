output "ansible_master_public_ip" {
  value = aws_instance.Ansible-Master.public_ip
}

output "ansible_client1_public_ip" {
  value = aws_instance.Ansible-Client-1.public_ip
}

output "ansible-client2_public_ip" {
  value = aws_instance.Ansible-Client-2.public_ip
}