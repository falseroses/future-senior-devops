#!/bin/bash
yum -y update
echo "Starting install and configuring Ansible..."
python3 -m pip install ansible
mkdir /home/ec2-user/ansible
mkdir /home/ec2-user/ansible/group_vars
cat <<EOF > /home/ec2-user/ansible/hosts.txt
[prod_servers]
linux1 ansible_host=172.31.16.100
linux2 ansible_host=172.31.16.101
EOF
cat <<EOF > /home/ec2-user/ansible/group_vars/prod_servers
ansible_user                 : ec2-user
ansible_ssh_private_key_file : /home/ec2-user/.ssh/falseroses-key-Frankfurt.pem
EOF
cat <<EOF > /home/ec2-user/ansible/ansible.cfg
[defaults]
host_key_checking = false
inventory = ./hosts.txt
interpreter_python = /usr/bin/python3
deprecation_warnings = false
EOF
echo "All done!"