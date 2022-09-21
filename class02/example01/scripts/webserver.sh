#!/bin/bash
echo "Provisioning virtual machine..."

# update packages
apt-get update

echo "Installing Nginx"
# nginx service: install and start
apt-get install nginx -y
service nginx start