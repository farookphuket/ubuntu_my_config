#!/bin/bash 



# need root to move file 

ICON_DIR=../FILES_INC_Icons
ZSH_DIR=../FILES_INC_ZSH
FONTS_DIR=../FILES_INC_FONTS
FILES=files

# copy Icons
cp -r $ICON_DIR/Icons/Lyra-red/ /usr/share/icons/ 
cp -r $ICON_DIR/Icons/Lyra-red-dark/ /usr/share/icons/ 
cp -r $ICON_DIR/Icons/Infinity-Dark-Icons/ /usr/share/icons/ 
cp -r $ICON_DIR/Icons/Cyan-Breeze-Dark-Icons /usr/share/icons 

# i3Status
cp $FILES/i3status.conf /etc/

# copy zsh 
cp -r $ZSH_DIR/zsh /usr/share/
cp -r $ZSH_DIR/zsh-theme-powerlevel10k /usr/share/
