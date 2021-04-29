#!/bin/bash 



#ICON_DIR=../FILES_INC_Icons
ZSH_DIR=../FILES_INC_ZSH
#FONTS_DIR=../FILES_INC_FONTS
FILES=files

echo "========= this will download wall paper please be patiently ========="

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
cp $ZSH_DIR/.zshrc ~/ 
