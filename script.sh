#!/bin/bash

 sudo apt-get update -y
 sudo apt-get install docker.io -y
 sudo systemctl start docker
 sudo systemctl enable docker
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 sudo echo "PASSWORD=${PASSWORD}" >> /home/ubuntu/.env
 sudo chown ubuntu:ubuntu /home/ubuntu/.env
 sudo chmod 600 /home/ubuntu/.env
 sudo apt install nginx -y
 echo 'Hostname is ' $(hostname -f) | sudo tee /var/www/html/index.html
 sudo systemctl start nginx
 sudo systemctl enable nginx

 