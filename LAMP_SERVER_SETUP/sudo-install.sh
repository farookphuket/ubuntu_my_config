#!/bin/bash 



apt update && apt upgrade -yy 

# close firefox
pkill firefox

apt install apache2 composer cmake build-essential -yy


ufw allow "Apache"

ufw allow 9000/tcp 

apt install mysql-server -yy 


mysql_secure_installation 

# just in case you have forgot the command 
# there will be the firefox window pop at the first time you run the script
# sudo mysql 
# use mysql;
# ALTER user 'root'@'localhost' 
# IDENTIFIED WITH mysql_native_password BY '<!--Password1234-->';
# FLUSH PRIVILEGES;
# quit;

apt install php php-mysql libapache2-mod-php  php-sqlite3 php-mbstring -yy

apt install php-intl php-xml php-zip php-curl php-json php-gd -yy

mkdir -p /var/www/html/lav8.x1/public

chmod 777 -R /var/www/html/lav8.x1 





