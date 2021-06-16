#!/bin/bash
yum -y update
echo "Starting install Ansible..."
python3 -m pip install ansible
echo "Done"