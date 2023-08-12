#!/bin/sh
sudo docker kill $(docker ps -aqf "name=^ytpl$")
sudo docker image rm -f ytpl
cd ./ytpl/ytpl &&\
    go build &&\
    mv ./ytpl ../opt/ytpl &&\
    cd .. &&\
    sudo docker build -t "ytpl" . &&\
    rm ./opt/ytpl &&\
   docker-compose up -d
