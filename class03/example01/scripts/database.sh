#!/bin/bash
echo "Setting database..."

# Install mysql
echo "Installing mysql"

apt-get install debconf-utils -y
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234" 
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
apt-get install mysql-server -y