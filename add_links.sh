#!/usr/bin/env bash

mkdir -p ~/configs/apache/sites-available
mkdir -p ~/configs/nginx/sites-available

sudo rm -r /etc/apache2/sites-available/
sudo ln -s ~/configs/apache/sites-available/ /etc/apache2/

sudo cp -sR /etc/apache2/sites-available/* /etc/apache2/sites-enabled/
