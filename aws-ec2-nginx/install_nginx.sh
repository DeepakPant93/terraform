#!/bin/bash

apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

echo "<h1>Welcome to Nginx on AWS EC2 by Deepak</h1>" | sudo tee /var/www/html/index.html