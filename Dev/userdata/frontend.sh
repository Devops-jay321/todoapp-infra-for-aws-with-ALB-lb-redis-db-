#!/bin/bash
set -e

apt update -y
apt install -y nginx
chmod -R 777 /var

systemctl enable nginx
systemctl start nginx
