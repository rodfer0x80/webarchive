#!/bin/sh

cd ./ytpl/ytpl && go build main.go && mv ./ytpl ../opt/ && cd ..
sudo docker build -t "ytpl" .
rm ./opt/ytpl
