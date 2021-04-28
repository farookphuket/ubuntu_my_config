#!/bin/bash 




echo "====== this will setup lamp server for Ubuntu ========"


# install the program 
sudo ./sudo-install.sh

# just in case you forgot the command  
firefox -- ./files/info.html &
 

./file_manager.sh 


# will install dbeaver 
./install_dbeaver.sh


firefox -- "http://lav8.x1" & 

firefox -- "phpmyadmin:9000" &

firefox -- "https://www.farookphuket.com" &


echo "================ Dear $USER ====================="
echo " your lamp server is up and runing now"
echo " enjoy your web app coding "
echo "================================================="



sleep 5s

exit

