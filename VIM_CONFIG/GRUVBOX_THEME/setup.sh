#!/bin/bash 



# we have to run update just in case some package need to be update
sudo apt update && sudo apt upgrade -yy

# install the require program
sudo ./install_require_app.sh

# run copy file into home folder
./file_manager.sh 


# copy the config file to root user 
# this option will be disable by default 
echo "============== Dear $USER ======================================="
echo " the config for the root user is disable by default"
echo " if you do want to change root config with this config as well "
echo " please un-comment(remove the # sign) the code at the line "
echo " #sudo ./file_manager_root.sh"
echo " then re-run the script again."
echo " please logout and log back in to see the effect"
echo " "
echo " if you have problem with install coc-explorer you may have to run"
echo " npm cache clean --force "
echo " then re-open vim ."
echo " :CocInstall coc-explorer"
echo " "
echo " hope this will work for you or please watch my video again."
echo " ============ Operation has DONE! please logout =================="






# sudo ./file_manager_root.sh 

