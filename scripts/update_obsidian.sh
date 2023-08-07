#!/bin/sh

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"

# cd docker-compose.yml dir
cd "$(dirname $0)/../obsidian" || exit 1

# if there is no data saved setup dir
test -e $DATA || \
    mkdir -p $DATA  && \
    chmod -R 777 "$DATA/.." ||\
    exit 2

# update local.ini file to mount on volume
cp "./local.ini" $LOCAL_INI || exit 3

./scripts/run_obsidian.sh || exit 4
