#!/bin/sh
git pull || echo "[0]"
sudo rm -rf /var/www/html/docs || echo "[1]"
sudo cp -r ./docs /var/www/html || echo "[2]"
sudo chown -R www-data:www-data /var/www/html/docs || echo "[3]"
sudo chmod -R 770 /var/www/html/docs || echo "[4]"
sudo cp ./configs/nginx.conf /etc/nginx/nginx.conf || echo "[5]"
sudo systemctl restart nginx || echo "[6]"
sudo systemctl status nginx || echo "[7]"