#!/bin/bash

sudo apt update
sudo apt install -y nginx

sudo rm -rf /var/www/html/*
sudo cp -r ~/build/* /var/www/html/

sudo systemctl start nginx

sleep 5 

STATUS_CODE=$(curl -LI http://localhost | grep -i http | awk '{print $2}')
if [ $STATUS_CODE -eq 200 ]; then
  echo "Success! Got 200 response from local server"
  exit 0
else
  echo "Failed! Expected 200 response, got $STATUS_CODE" 
  exit 1
fi

sudo systemctl stop nginx