#!/bin/bash 



echo "================= Install and setup I3Wm by farook ====================="
echo "================= For Ubuntu ,Debian ,Linux Mint  ======================"
echo "================= Warning ❗========"
echo " this script will install some require program for you "
echo " it may take up to 1 hour 30 minute (it's really depending upon your "
echo " your internet connection in my case I need 1 and half hour )"
echo " for this to be done) it's seem like I cannot do anything here" 
echo " so please wait and be patiently "
echo ""
echo " if 1 hour and half is too much for you please quit this script"
echo " by pressing Ctrl+c "
echo ""
echo " ======================================================================="
echo " during the installation you may have to enter your password"
echo " you may have to logout after the process has done "
echo "========================================================================"




# ============ this will install program on your machine =====================
# install the require program 
sudo ./sudo-install.sh 
# the sudo-install script will call file_manager_root script 
# in order to copy files using root privileges


# ============ COPY FILE =====================================================
# this will copy the file this will take 40 minute
./file-manager.sh



# ==================== run install file ====================================== 
# ============================================================================
# 
# this will take up-to 10 minute if you do not want to install all of this 
# package which can be take too much time so just put the '#' sign infront of 
# the below line
./none-sudo-install.sh

# ============================================================================




# ============================================================================
# ========== will install the program that I use =============================
# this will call the script that will install the program that 
# I personally use that's why I comment the calling script 
# this script alone can be take upto 30 minute 
# so if you're okay with this you can just remove '#' from the below line
sudo ./program_other.sh

# ============================================================================


# ====================== Cmus Music player =========================
# create folder for cmus
mkdir -p ~/.config/cmus 
# call cmus for the first run 
gnome-terminal -- cmus
sleep 5s 
FILES_DIR=files
# cmus config
cp $FILES_DIR/update-cmus-library.sh ~/.config/cmus
# =================================================================



# at the time after we have i3 install the folder i3 is not yet create
# let create one now
mkdir -p ~/.config/i3/

# copy main i3 config to ~/.config/i3
cp $FILES_DIR/config ~/.config/i3/ 

# command for reboot shutdown
cp -r $FILES_DIR/command ~/.config/i3/

# conky config
cp -r $FILES_DIR/conky ~/.config/



# ================ Warning! ===================================================
# change to using zsh instead of bash
#
# if the line sudo ./program_other.sh is un-comment the below line will 
# also need to be un-comment as well
#
# un comment this line only if you un-comment the line 
# ./program_other.sh from above as well
chsh -s /usr/bin/zsh 



echo "================= ✅ your process has Done ! $USER  ===================="
echo " please logout and log back in using i3 session "
echo " if you don't know how to please watch my video "
echo "========================================================================"


sleep 5s 



# open the youtube link
firefox -- "https://www.youtube.com/watch?v=q3Sanjl93dQ&list=PLWv3Eu4jXcQiwpZTKMZaFXB5L3dogTuCT&index=2" &


#reboot
