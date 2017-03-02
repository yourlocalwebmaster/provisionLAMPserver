#!/bin/bash
### Author: Grant Kimball
### Provision a LAMP the server on UBUNTU 16.04
###

apt-get -y update
apt-get -y upgrade

#APACHE2#
apt-get -y install apache2
service start apache2

#MYSQL
apt-get -y install mariadb-server mariadb-client
mysql_secure_installation

#PHP#
apt-get -y install php7.0 libapache2-mod-php7.0
service apache2 restart

#Create test (located at xxx.xxx.xxx/info.php)
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

chown www-data:www-data /var/www/html/info.php

#install optional dependencies
apt-get -y install sudo apt-get install php7.0-zip php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext php-mbstring php-mcrypt php-gd

apt-get install npm nodejs

npm install --global gulp

ln -s /usr/bin/nodejs /usr/bin/node

systemctl restart apache2

echo "\n Ok, should be provissioned, visit your site to verify php is running.(where the X's is your public IP address)\n i.e. xxx.xxx.xxx.xxx/info.php  ...\n"

# self destruct when done...
rm provision_server.sh