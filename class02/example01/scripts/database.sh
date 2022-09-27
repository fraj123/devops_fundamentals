#!/bin/bash
apt-get -y update

apt-get upgrade

apt-get install postgresql postgresql-contrib

systemctl start postgresql.service