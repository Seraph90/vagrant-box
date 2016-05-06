#!/bin/bash

echo "Create symlinks"

for file in /var/conf/sites-enabled/*
do
	rm /etc/nginx/sites-enabled/${file##*/}
	ln -s /etc/nginx/sites-available/${file##*/} /etc/nginx/sites-enabled/
done
