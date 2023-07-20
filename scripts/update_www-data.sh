#!/bin/sh
sudo rm -rf /var/www/html/docs || echo "[1]"
sudo cp -r ./docs /var/www/html || echo "[2]"
sudo chown -R www-data:www-data /var/www/html/docs || echo "[3]"
sudo chmod -R 770 /var/www/html/docs || echo "[4]"