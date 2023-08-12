#!/bin/sh

cd ./ytpl/ytpl && go build main.go && mv ./main ../opt/ytpl && cd ..
sudo docker build -t "ytpl" . --name ytpl
rm ./opt/ytpl
docker compose up -d
#sudo docker-compose up -d
