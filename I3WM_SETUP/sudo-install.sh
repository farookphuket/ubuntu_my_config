#!/bin/bash


# update the system first 
apt update && apt upgrade -yy


apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight -yy 

apt install alsa-tools  xdg-utils dunst conky -yy


# keyboard indicator wallpaper 
apt install xxkb nitrogen pavucontrol  -yy


apt install curl -yy

apt install i3-wm i3lock i3lock-fancy i3status lxsession plasma-desktop -yy

# only can show the volume icon but cannot adjust sound
apt install volumeicon-alsa cmus -yy

# install polkit without this you will not be able to install 
# program thrught Snap Store
apt install policykit-1-gnome -yy



# install gaps copy code 1 May 2021 from
# https://blog.elreydetoda.site/minimal-i3-gaps-install-ubuntu/
add-apt-repository -y ppa:regolith-linux/stable
apt update && apt install i3-gaps -yy



# sleep 5
sleep 5s

# do dist-upgrade 
apt update && apt dist-upgrade -yy

# remove the orphan package
apt autoremove -yy

# copy the icons 
./file_manager_root.sh 



