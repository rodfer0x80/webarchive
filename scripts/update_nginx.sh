#!/bin/sh
sudo cp ./nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
sudo systemctl status nginx
