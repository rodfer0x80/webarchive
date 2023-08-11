#!/bin/sh
sudo docker ps | head -n 2 | tail -n 1 | cut -d" " -f1 | xargs sudo docker stop
sudo docker image rm -f ytpl
