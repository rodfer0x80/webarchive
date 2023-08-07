#!/bin/sh
sudo iptables -I INPUT -p tcp -m tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 5984 -j ACCEPT # couchdb
sudo iptables -I INPUT -p tcp -m tcp --dport 53 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport * -j DENY
