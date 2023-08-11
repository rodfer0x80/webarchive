#!/bin/sh

test -e ".env" || exit 1
USERNAME="$(cat .env | head -n 1 | cut -d'=' -f2)"
PASSWORD="$(cat .env | head -n 2 | tail -n 1 | cut -d'=' -f2)"

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

sudo docker ps | head -n 2 | tail -n 1 | cut -d" " -f1 | xargs sudo docker stop
sudo docker image rm -f couchdb

sudo docker run --rm -d \
    -e COUCHDB_USER="$USERNAME" \
    -e COUCHDB_PASSWORD="$PASSWORD" \
    -v $LOCAL_INI:"/opt/couchdb/etc/local.ini" \
    -v $DATA:"/opt/couchdb/data" \
    -p 5984:5984 \
    couchdb
