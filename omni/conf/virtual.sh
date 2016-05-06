#!/bin/bash

rm /etc/$1/sites-available/ -R > /dev/null 2>&1
rm /etc/$1/sites-enabled/ -R > /dev/null 2>&1
cp /var/conf/sites-available/ /etc/$1/sites-available/ -R
mkdir /etc/$1/sites-enabled/ > /dev/null 2>&1

echo "Create symlinks"

for file in /var/conf/sites-enabled/*
do
	ln -s /etc/$1/sites-available/${file##*/} /etc/$1/sites-enabled/
done
