#!/bin/bash 

# run copy file into home folder
./file_manager.sh 


# copy the config file to root user 
# this option will be disable by default 
echo "============== Dear $USER ======================================="
echo " the config for the root user is disable by default"
echo " if you do want to change root config with this as well "
echo " please un-comment(remove the # sign) the code at the line "
echo " #sudo ./file_manager_root.sh"
echo " then re-run the script again."
echo " ============ Operation has DONE! please logout =================="

# sudo ./file_manager_root.sh 
