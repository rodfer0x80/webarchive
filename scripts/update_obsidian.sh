#!/bin/sh

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

USER="$1"
PASSWD="$2"
if [ -z "$USER" ]; then
    exit 1
fi
if [ -z "$PASSWD" ]; then
    exit 2
fi
docker ps | head -n 2 | tail -n 1 | cut -d" " -f1 | xargs sudo docker stop

cd ./obsidian
test -e $DATA ||\
   mkdir -p $DATA
test -e $LOCAL_INI ||\
   cp "./local.ini" $LOCAL_INI
chmod -R 770 $DATA $LOCAL_INI

docker run --rm -d -t --name obsidian -p "5984:5984" -v "$DATA:/opt/couchdb/data" -v "$LOCAL_INI:/opt/couchdb/etc/local.ini" -e COUCHDB_USER="$USER" -e COUCHDB_PASSWORD="$PASSWD" couchdb


