#!/bin/bash 


# this file is call by file_manager

# the file directory
FILES_DIR=files

# copy php myadmin config file to apache 
cp $FILES_DIR/phpmyadmin.conf /etc/apache2/sites-available/

# copy the file config for phpmyadmin
cp $FILES_DIR/config.inc.php /opt/phpmyadmin/

# change the directory /opt/phpmyadmin owner to www-data
chown -Rfv www-data:www-data /opt/phpmyadmin 

# hosts file
cp $FILES_DIR/hosts /etc 

# make the folder just in case has error 
mkdir -p /var/run/mysqld 
chown mysql: /var/run/mysqld 

# replace config file 
cp $FILES_DIR/lav8.x1.conf /etc/apache2/sites-available/
cp $FILES_DIR/ports.conf /etc/apache2/ 
cp $FILES_DIR/apache2.conf /etc/apache2/

a2dissite 000-default.conf 


a2ensite lav8.x1.conf


a2ensite phpmyadmin.conf


a2enmod rewrite 

systemctl restart apache2
# copy config for apache 
#cp lav8.x1.conf /etc/apache2/sites-avilable/
