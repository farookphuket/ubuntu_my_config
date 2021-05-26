#!/bin/bash 



# this script will be install spotify 
# music player

#curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# sudo apt-get update && sudo apt-get install spotify-client

sudo apt update && sudo apt upgrade -yy && sudo apt dist-upgrade -yy 

sudo apt install curl -yy

# install from snap
sudo snap install spotify
