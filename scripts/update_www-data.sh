#!/bin/sh
sudo rm -rf /var/www/html/docs
sudo cp -r ./docs /var/www/html
sudo chown -R www-data:www-data /var/www/html/docs
sudo chmod -R 770 /var/www/html/docs
