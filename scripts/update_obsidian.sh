#!/bin/sh

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

sudo docker ps | head -n 2 | tail -n 1 | cut -d" " -f1 | xargs sudo docker stop

cd ./obsidian
test -e $DATA ||\
   sudo mkdir -p $DATA
test -e $LOCAL_INI ||\
   sudo cp "./local.ini" $LOCAL_INI
sudo chmod -R 755 $DATA $LOCAL_INI

sudo docker run --rm -d -t --name obsidian -p "5984:5984" -v "$DATA:/opt/couchdb/data" -v "$LOCAL_INI:/opt/couchdb/etc/local.ini" -e COUCHDB_USER="obsidian" -e COUCHDB_PASSWORD="obsidian" couchdb

cd ..

