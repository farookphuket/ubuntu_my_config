#!/bin/bash 



echo "================= Install and setup I3Wm by farook =============="
echo "================= For Ubuntu ,Debian ,Linux Mint  ==============="
echo "===== Warning ========"
echo " this script will install some require program for you "
echo " it may take up to 15 minute please be patiently "
echo " during the installation you may have to enter your password"
echo " you may have to logout after the process has done "
echo "=================================================================="

./file-manager.sh






# install the require program 
sudo ./sudo-install.sh 
# the sudo-install script will call file_manager_root script 
# in order to copy files using root privileges


# call cmus for the first run 
gnome-terminal -- cmus

sleep 5s 

FILES_DIR=files

# cmus config
cp $FILES_DIR/update-cmus-library.sh ~/.config/cmus

# at the time after we install the folder i3 is not yet create
mkdir -p ~/.config/i3/

# copy main i3 config to ~/.config/i3
cp $FILES_DIR/config ~/.config/i3/ 

# command for reboot shutdown
cp -r $FILES_DIR/command ~/.config/i3/

# conky config
cp -r $FILES_DIR/conky ~/.config/


# change to using zsh instead of bash
chsh -s /usr/bin/zsh 



echo "================= your process has Done ! $USER  ============"
echo " please logout and log back in using i3 session "
echo " if you don't know how to please watch my video "
echo "============================================================="


sleep 5s 




firefox -- "https://www.youtube.com/watch?v=q3Sanjl93dQ&list=PLWv3Eu4jXcQiwpZTKMZaFXB5L3dogTuCT&index=2"
#reboot
