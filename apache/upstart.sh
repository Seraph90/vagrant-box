#!/bin/bash

# Variables
DBUSER=root
DBPASSWD=dev

sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

echo "Updating APT respositories"
    apt-get update > /dev/null 2>&1
    apt-get install nano htop > /dev/null 2>&1

echo "Installing PHP"
    apt-get install php5-common php5-dev php5-cli -y > /dev/null 2>&1

echo "Installing PHP extensions"
    apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null 2>&1

echo "Installing utilities"
    apt-get install -y mc apache2 unzip zip curl > /dev/null 2>&1
    apt-get install debconf-utils -y > /dev/null 2>&1

echo "Installing MySQL Server"
    echo "mysql-server mysql-server/root_password password ${DBPASSWD}" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password ${DBPASSWD}" | debconf-set-selections
    apt-get install mysql-server -y > /dev/null 2>&1

# echo "Installing phpMyAdmin"
    # echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
    # echo "phpmyadmin phpmyadmin/app-password-confirm password ${DBPASSWD}" | debconf-set-selections
    # echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${DBPASSWD}" | debconf-set-selections
    # echo "phpmyadmin phpmyadmin/mysql/app-pass password ${DBPASSWD}" | debconf-set-selections
    # echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
    # apt-get install phpMyAdmin -y > /dev/null 2>&1

echo "Configure nginx & php"
    cp /var/conf/apache2.conf /etc/apache2/
    cp /var/conf/php.ini /etc/php5/apache2/

echo "Configure virtual hosts"
    chmod +x /var/conf/siteconf.sh
    /var/conf/siteconf.sh
    chmod +x /var/conf/virtual.sh
    /var/conf/virtual.sh

echo "Restarting services"
    service apache2 restart > /dev/null 2>&1

# TODO: проверки на удачность
#echo "Success"
