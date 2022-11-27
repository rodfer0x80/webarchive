#!/bin/sh
sudo cp ./configs/nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
sudo systemctl status nginx
