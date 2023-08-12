#!/bin/sh

LOCAL_INI="/var/www/obsidian/local.ini"
DATA="/var/www/obsidian/data"


cd ./obsidian &&\
   test -e $DATA ||\
   mkdir -p $DATA &&\
   test -e $LOCAL_INI ||\
   cp "./local.ini" $LOCAL_INI &&\
   chmod -R 755 $DATA $LOCAL_INI &&\
   sudo docker-compose up -d;\
   cd ..

sudo docker ps | head -n 2 | tail -n 1 | cut -d" " -f1 | xargs sudo docker stop
sudo docker image rm -f couchdb
