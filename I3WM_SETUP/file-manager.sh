#!/bin/bash 



#ICON_DIR=../FILES_INC_Icons
# ZSH_DIR=../FILES_INC_ZSH
#FONTS_DIR=../FILES_INC_FONTS
FILES_DIR=files

echo "========= this will download wall paper please be patiently ============"
echo " Dear $USER  this operation can be take upto 40 minute or 1 hour"
echo " the operation now is dowloading the Icons,wallpaper and themes now"
echo " this process is will be depending up on your connection speed!"
echo " please wait..."
echo "========================================================================"

# create dir in user home 
mkdir -p  ~/TEMP_FILES

# cd into dir
pushd ~/TEMP_FILES 

# clone zsh theme
git clone https://gitlab.com/farookphuket/my_zsh.git 

ZSH_DIR=~/TEMP_FILES/my_zsh/ZSH/FOR_UBUNTU

cp $ZSH_DIR/.zshrc ~/

# copy zsh config to /usr/share
sudo cp -r $ZSH_DIR/zsh/ /usr/share/
#sudo cp -r $ZSH_DIR/zsh-theme-powerlevel10k /usr/share

sleep 5s 

# clone icons 
git clone https://gitlab.com/farookphuket/my_icons.git

ICONS_DIR=~/TEMP_FILES/my_icons/icons
THEMES_DIR=~/TEMP_FILES/my_icons/themes


# icons 
# Infinity-Dark-Icons
# whiskermenu-manjaro.svg
# Lyra-red-dark
# Mintjaro
# RevengeShip
sudo cp -r $ICONS_DIR/whiskermenu-manjaro.svg /usr/share/icons 

sudo cp -r $ICONS_DIR/RevengeShip /usr/share/icons 

sudo cp -r $ICONS_DIR/Lyra-red-dark /usr/share/icons 

sudo cp -r $ICONS_DIR/Lyra-red /usr/share/icons 

sudo cp -r $ICONS_DIR/Mintjaro /usr/share/icons 


# Themes
# Raleigh
# HighContrast

sudo cp -r $THEMES_DIR/Raleigh/ /usr/share/themes/ 
sudo cp -r $THEMES_DIR/HighContrast/ /usr/share/themes/




# clone fonts from gitlab 
git clone https://gitlab.com/farookphuket/my_fonts.git

# fonts dir [3270 Hack TH-FONT]


FONTS_DIR=~/TEMP_FILES/my_fonts/FONTS

# copy font to /usr/share/fonts
sudo cp -r $FONTS_DIR/3270/ /usr/share/fonts/
sudo cp -r $FONTS_DIR/Hack/ /usr/share/fonts/
sudo cp -r $FONTS_DIR/TH-FONT/ /usr/share/fonts/


sleep 5s

# back to run script folder
popd





# check if the Wallpapers dir is exited
if [[ -d ~/Pictures/Wallpapers ]] && [[ -n `ls -A ~/Pictures/Wallpapers `  ]]; then

    pushd ~/Pictures/Wallpapers
    git clone https://gitlab.com/farookphuket/wallpapers.git .
    sleep 5s
    popd 

fi

mkdir ~/Pictures/Wallpapers
pushd ~/Pictures/Wallpapers 
git clone https://gitlab.com/farookphuket/wallpapers.git .
sleep 5s

# back to run script folder
popd

# copy the config for xxkeyboard 
cp $FILES_DIR/.xxkbrc ~/ 




