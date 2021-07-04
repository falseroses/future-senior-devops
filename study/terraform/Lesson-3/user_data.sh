#!/bin/bash
yum -y update
yum -y install httpd
yum -y install git
git clone https://github.com/falseroses/falseroses.xyz
cd falseroses.xyz
cp * /var/www/html/
service httpd start
chkconfig httpd on