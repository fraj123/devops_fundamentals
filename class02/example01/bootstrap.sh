# Update Packages
apt-get -y update
# Upgrade Packages
apt-get upgrade

#Install nginx
apt-get install -y nginx

#Start nginx
service nginx start

# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQLS
apt-get install -y mysql-server