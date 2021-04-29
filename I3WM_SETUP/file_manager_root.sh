#!/bin/bash 



# need root to move file 

FONTS_DIR=../FILES_INC_FONTS
FILES=files


# i3Status
cp $FILES/i3status.conf /etc/

# copy fonts 
cp -r $FONTS_DIR/ /usr/share/fonts/THAI_FONTS

