#!/bin/bash

echo "Create symlinks"
	rm /etc/nginx/sites-enabled/akbenergo.conf
	rm /etc/nginx/sites-enabled/wordpress.conf
    ln -s /etc/nginx/sites-available/akbenergo.conf /etc/nginx/sites-enabled/
    ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
