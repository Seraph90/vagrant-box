#!/bin/bash

echo "Create symlinks"
	rm /etc/nginx/sites-enabled/akbenergo.conf
    ln -s /etc/nginx/sites-available/akbenergo.conf /etc/nginx/sites-enabled/
