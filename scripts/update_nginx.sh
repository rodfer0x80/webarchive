#!/bin/sh
sudo cp ./configs/nginx.conf /etc/nginx/nginx.conf || echo "[5]"
sudo systemctl restart nginx || echo "[6]"
sudo systemctl status nginx || echo "[7]"