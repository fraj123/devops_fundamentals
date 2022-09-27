#!/bin/bash
apt-get update -y

apt-get upgrade

apt-get install nginx -y

service nginx start

