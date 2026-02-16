#!/bin/bash
set -e

apt update -y
apt install -y nginx
chmod -R 755 /var/www/html

systemctl enable nginx
systemctl start nginx
