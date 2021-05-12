#!/bin/bash


# update the system first 
apt update && apt upgrade -yy


apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight -yy 

apt install alsa-tools  xdg-utils dunst lxappearance-obconf -yy


# keyboard indicator wallpaper 
apt install xxkb nitrogen pavucontrol blueman cmus -yy

apt install lxsession lxappearance conky  -yy

apt install i3-wm i3lock i3lock-fancy i3status lxsession plasma-desktop -yy

apt install zsh zsh-theme-powerlevel9k zsh-autosuggestions -yy

apt install zsh-syntax-highlighting zsh-antigen -yy

apt install fonts-powerline nodejs npm tmux vim-gtk3 neovim -yy

apt install vim-ale python3-neovim htop neovim-runtime -yy

apt install gnome-terminal-data powerline -yy

# only can show the volume icon but cannot adjust sound
apt install volumeicon-alsa -yy

# install polkit without this you will not be able to install 
# program thrught Snap Store
apt install policykit-1-gnome -yy

# install gnome tweak tools as lxappearance not working in Ubuntu 21.04
apt install gnome-tweaks gnome-shell-extensions -yy

apt install powerline-gitstatus -yy

apt install diodon gcc git  acpi libnotify-bin -yy


# I'm not using shutter now I use flameshot
add-apt-repository -y -u ppa:linuxuprising/shutter

# install shutter 
apt update && apt install shutter -yy

# screen capture
apt install flameshot -yy

apt install mlocate -yy 
# install gaps copy code from 1 May 2021
# https://blog.elreydetoda.site/minimal-i3-gaps-install-ubuntu/
add-apt-repository -y ppa:regolith-linux/stable
apt update && apt install i3-gaps -yy

# install by snap 
snap install pa-applet brave unifonter


updatedb

# sleep 5
sleep 5s



# copy the icons 
./file_manager_root.sh 



