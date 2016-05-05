#!/bin/bash

rm /etc/apache2/sites-available/ -R > /dev/null 2>&1
rm /etc/apache2/sites-enabled/ -R > /dev/null 2>&1
cp /var/conf/sites-available/ /etc/apache2/sites-available/ -R
mkdir /etc/apache2/sites-enabled/ > /dev/null 2>&1
