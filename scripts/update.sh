#!/bin/sh

OBSIDIAN_USER="$1"
OBSIDIAN_PASSWD="$2"
if [ -z "$1" ]; then
    exit 1
fi
if [ -z "$2" ]; then
    exit 2
fi
git pull || echo "[0]"
sudo rm -rf /var/www/html/docs || echo "[1]"
sudo cp -r ./docs /var/www/html || echo "[2]"
sudo ./scripts/update_obsidian.sh $OBSIDIAN_USER $OBSIDIAN_PASSWD|| echo "[3]"
sudo chown -R www-data:www-data /var/www/ || echo "[4]"
sudo chmod -R 770 /var/www || echo "[5]"
sudo cp ./configs/nginx.conf /etc/nginx/nginx.conf || echo "[6]"
sudo systemctl restart nginx || echo "[7]"
sudo systemctl status nginx || echo "[8]"
