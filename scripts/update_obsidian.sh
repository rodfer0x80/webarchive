#!/bin/sh

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

# cd docker-compose.yml dir
cd "$(dirname $0)/../obsidian" || exit 1

# if there is no data saved setup dir
sudo test -e $DATA || \
    sudo mkdir -p $DATA  && \
    sudo chmod -R 777 "$DATA/.." ||\
    exit 2

# update local.ini file to mount on volume
sudo cp "./local.ini" $LOCAL_INI || exit 3

sudo docker-compose up -d  || exit 4
