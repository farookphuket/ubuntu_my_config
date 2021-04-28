#!/bin/bash 




# install phpmyadmin
./install_phpmyadmin.sh





# copy the index file to /var/www/html/lav8.x1/public
cp files/index.php /var/www/html/lav8.x1/public


# call file_manager_root 
sudo ./file_manager_root.sh
