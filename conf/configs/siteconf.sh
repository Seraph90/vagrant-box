#!/bin/bash

    rm /etc/nginx/sites-available/ -R
    rm /etc/nginx/sites-enabled/ -R
    cp /var/conf/sites-available/ /etc/nginx/sites-available/ -R
    mkdir /etc/nginx/sites-enabled/
