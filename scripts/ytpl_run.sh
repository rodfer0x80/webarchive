#!/bin/sh
sudo docker run \
    -d \
    -v $PWD/ytpl/opt:/run \
    -p 8090:8090 \
    ytpl \
    "/root/run/ytpl"
