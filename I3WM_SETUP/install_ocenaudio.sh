#!/bin/bash 


# install ocenaudio to replace audacity as audacity will be no longer 
# play nice to the free software 
# https://www.ocenaudio.com/start_download/ocenaudio_debian9_64.deb

pushd ~/Downloads/ 

# call firefox to open the download link 
firefox -- https://www.ocenaudio.com/start_download/ocenaudio_debian9_64.deb




echo "========================= Dear $USER ==================================="
echo " I don't know if this going to install as I can't install this using "
echo " the command line the link to download will be :"
echo " https://www.ocenaudio.com/start_download/ocenaudio_debian9_64.deb " 
echo " you can type the command sudo dpkg -i follow by the file name"
echo " please make sure that you have save the download file in ~/Downloads"
echo "========================================================================"

sleep 5s

popd 
