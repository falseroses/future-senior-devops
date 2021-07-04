output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.my_vpc.id
}

output "vpc_cidr_block_ip" {
  description = "ID of project VPC"
  value       = aws_vpc.my_vpc.cidr_block
}

output "subnet_id" {
  description = "ID of project Subnet"
  value       = aws_subnet.my_subnet.id
}

output "subnet_cidr_block_ip" {
  description = "ID of project Security Group"
  value       = aws_subnet.my_subnet.cidr_block
}

output "security_group_id" {
  description = "ID of project Security Group"
  value       = aws_security_group.my_security_group.id
}

output "security_group_description" {
  description = "ID of project Security Group"
  value       = aws_security_group.my_security_group.description
}