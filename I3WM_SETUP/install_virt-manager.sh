#!/bin/bash

# update upgrade the package
sudo apt update && sudo apt upgrade -yy && sudo apt dist-upgrade -yy

# install libvirt and it require program
sudo apt install qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager -yy

# enable virt-manager on boot
sudo systemctl enable --now libvirtd


# add user
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu


# print on screen
echo "========================= Warning! ====================================="
echo "Dear $USER this is very important! that you may have to reboot "
echo " in order to using the program virt-manager "
echo "========================================================================"

