#!/bin/bash
yum -y update
echo "Starting installing Nginx..."
amazon-linux-extras install -y nginx1
systemctl start nginx.service
systemctl enable nginx.service
echo "All done!"