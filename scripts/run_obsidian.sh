#!/bin/sh

USER="obsidian"
password="obsidian"
LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

docker run --rm -d \
    -e COUCHDB_USER=$USER \
    -e COUCHDB_PASSWORD=$PASSWD \
    -v $LOCAL_INI:"/opt/couchdb/etc/local.ini" \
    -v $DATA:"/opt/couchdb/data" \
    -p 5984:5984 \
    couchdb
