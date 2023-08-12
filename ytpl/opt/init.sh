#!/bin/bash
yes | pacman -Syyu $(cat ./packages.txt)
