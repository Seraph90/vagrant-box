#!/bin/bash

rm /etc/nginx/sites-available/ -R > /dev/null 2>&1
rm /etc/nginx/sites-enabled/ -R > /dev/null 2>&1
cp /var/conf/sites-available/ /etc/nginx/sites-available/ -R
mkdir /etc/nginx/sites-enabled/ > /dev/null 2>&1
