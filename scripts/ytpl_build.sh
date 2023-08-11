#!/bin/sh

cd ./ytpl/ytpl && go build main.go && mv main ../opt/ytpl && cd ..
sudo docker build -t "ytpl" .
rm /opt/ytpl
