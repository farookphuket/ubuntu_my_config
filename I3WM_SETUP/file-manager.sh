#!/bin/bash 



#ICON_DIR=../FILES_INC_Icons
# ZSH_DIR=../FILES_INC_ZSH
#FONTS_DIR=../FILES_INC_FONTS
FILES=files

echo "========= this will download wall paper please be patiently ========="
echo " Dear $USER "
echo " the operation now is dowloading the Icons,wallpaper and themes now"
echo " this process is will be depending up on your connection speed!"
echo " please wait..."
echo "======================================================================"

# create dir in user home 
mkdir -p  ~/TEMP_FILES

# cd into dir
pushd ~/TEMP_FILES 

# clone zsh theme
git clone https://gitlab.com/farookphuket/my_zsh.git 

ZSH_DIR=~/TEMP_FILES/my_zsh/ZSH

cp $ZSH_DIR/.zshrc ~/

sudo cp -r $ZSH_DIR/zsh /user/share
sudo cp -r $ZSH_DIR/zsh-theme-powerlevel10k /user/share

sleep 5s 

# clone icons 
git clone https://gitlab.com/farookphuket/my_icons.git

ICONS_DIR=~/TEMP_FILES/my_icons/icons
THEMES_DIR=~/TEMP_FILES/my_icons/themes

sudo cp -r $ICONS_DIR/ /usr/share/icons 
sudo cp -r $THEMES_DIR/ /usr/share/themes 


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

# copy the .zsh file 
# cp $ZSH_DIR/.zshrc ~/ 
