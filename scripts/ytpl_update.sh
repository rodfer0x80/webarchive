#!/bin/sh
sudo docker stop "$(docker ps -aqf "name=^ytpl$")"
sudo docker image rm -f ytpl
cd ./ytpl/ytpl &&\
    go build &&\
    mv ./ytpl ../opt/ytpl &&\
    cd .. &&\
    rm ./opt/ytpl &&\
    docker-compose up -d
