#!/bin/sh
sudo ufw disable
sudo ufw allow http
sudo ufw allow https
sudo ufw allow ssh
sudo ufw allow 5984 # coachdb
sudo ufw enable
