#! /bin/bash
sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
echo "Hello World" > /usr/share/nginx/html/index.html
