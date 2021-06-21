#!/bin/bash
yum -y update
echo "Starting installing Redis..."
amazon-linux-extras install -y redis6
systemctl start redis.service
systemctl enable redis.service
echo "All done!"