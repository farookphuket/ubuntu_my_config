#!/bin/bash 




echo "===============  ❗Warning ========================================="
echo " this SCRIPT will install the program onto your system"
echo " this operation will be take up to 40 minute (depending "
echo " upon your internet speed but mostly when I do it on my  "
echo " system is always took me 1 and half hour to be done)."
echo " there is nothing we can do with this so....please wait "
echo " ================================================================"

sleep 5s


# update the system
apt update && apt upgrade -yy


# blueman is blutooth program 
apt install blueman -yy


# =========================================================================
# this not working in Ubuntu 21.04 but you can use plasma-desktop instead
# 
apt install lxappearance lxappearance-obconf  -yy

# ========================================================================

# =======================================================================
# zsh shell and theme
apt install zsh zsh-theme-powerlevel9k zsh-autosuggestions -yy
apt install zsh-syntax-highlighting zsh-antigen -yy

# ======================================================================


# nodejs npm 
apt install nodejs npm -yy


# I personally love vim ,vim is my editor 
apt install tmux vim-gtk3 neovim vim-ale python3-neovim -yy

apt install fonts-powerline   -yy

apt install  htop neofetch -yy

apt install  powerline -yy


# gnome programs
apt install gnome-characters gnome-terminal-data -yy
apt install gnome-terminal xfce4-there -yy





# install gnome tweak tools as lxappearance not working in Ubuntu 21.04
apt install gnome-tweaks gnome-shell-extensions -yy

apt install powerline-gitstatus -yy

apt install diodon gcc git  acpi libnotify-bin -yy


# =============== Shutter ===========================================
# I'm not using shutter now I use flameshot
add-apt-repository -y -u ppa:linuxuprising/shutter
# install shutter 
apt update && apt install shutter -yy

# ===================================================================


# screen capture
apt install flameshot -yy

apt install mlocate -yy 


updatedb


# the command here will be take over 30 minute
# install by snap 
snap install pa-applet brave unifonter puddletag-snap
