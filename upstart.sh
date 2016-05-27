#!/bin/bash

# Variables
DBUSER=root
DBPASSWD=dev
SERVER=$1

sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

echo "Updating APT respositories"
    apt-get update > /dev/null 2>&1

echo "Installing PHP"
case $SERVER in
    nginx   ) apt-get install php5-fpm -y > /dev/null 2>&1;;
    apache2 ) apt-get install php5 libapache2-mod-php5 -y > /dev/null 2>&1;;
esac

echo "Installing PHP extensions"
    apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-cli php5-common php5-cgi php-pear php5-memcache php5-sqlite -y > /dev/null 2>&1

echo "Installing utilities"
    apt-get install mc unzip zip htop nano debconf-utils -y > /dev/null 2>&1

echo "Installing $SERVER"
case $SERVER in
    nginx   ) apt-get install nginx -y > /dev/null 2>&1;;
    apache2 ) apt-get install apache2 -y > /dev/null 2>&1;;
esac

echo "Installing MySQL Server"
    echo "mysql-server mysql-server/root_password password ${DBPASSWD}" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password ${DBPASSWD}" | debconf-set-selections
    apt-get install mysql-server -y > /dev/null 2>&1

if [[ $2 == 'Y' ]]; then
echo "Installing phpMyAdmin"
    echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/app-password-confirm password ${DBPASSWD}" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${DBPASSWD}" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/mysql/app-pass password ${DBPASSWD}" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
    apt-get install phpMyAdmin -y > /dev/null 2>&1
fi
echo "Configure $SERVER & php"
case $SERVER in
    nginx   ) 
    cp /var/configs/php.ini /etc/php5/fpm/
    cp /var/configs/php-fpm.conf /etc/php5/fpm/
;;
    apache2 ) 
    cp /var/configs/php.ini /etc/php5/apache2/
;;
esac
    cp /var/configs/$SERVER.conf /etc/$SERVER/

echo "Configure virtual hosts"
    chmod +x /var/scripts/virtual.sh
    /var/scripts/virtual.sh $SERVER

echo "Restarting services"
case $SERVER in
    nginx   )
        service nginx restart > /dev/null 2>&1
        service php5-fpm restart > /dev/null 2>&1;;
    apache2 ) service apache2 restart > /dev/null 2>&1;;
esac

# TODO: проверки на удачность
