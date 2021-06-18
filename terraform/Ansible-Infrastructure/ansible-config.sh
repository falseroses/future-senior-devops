#!/bin/bash
yum -y update
echo "Starting installing Ansible..."
python3 -m pip install ansible
echo "All done!"