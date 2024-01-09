#!/bin/bash
sudo apt update -y &&
sudo apt install -y nginx
echo "Hello World from 475916" > /var/www/html/index.html
