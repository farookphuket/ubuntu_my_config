#!/bin/bash


mkdir -p ~/Documents/VIM_CONFIG.old
BACKUP_DIR=~/Documents/VIM_CONFIG.old


echo "=============== Dear $USER ========================="
echo " this will change your vim config file "
echo " if you want your config back please check in "
echo " $BACKUP_DIR "
echo " ===================================================="

# check if .vim directory exited then make a back-up
if [[ -d ~/.vim ]]; then
    mv ~/.vim $BACKUP_DIR/.vim
fi

# check if .vimrc file exited then make a back-up
if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc $BACKUP_DIR/.vimrc
fi

# check if .bashrc file exited then make a back-up
if [[ -f ~/.bashrc ]]; then
    mv ~/.bashrc $BACKUP_DIR/.bashrc
fi


# check if .tmux.conf file exited then make a back-up
if [[ -f ~/.tmux.conf ]]; then
    mv ~/.tmux.conf $BACKUP_DIR/.tmux.conf
fi


# check if .zshrc file exited then make a back-up
if [[ -f ~/.zshrc ]]; then
    mv ~/.zshrc $BACKUP_DIR/.zshrc
fi


# copy folder .vim to home folder
cp -r .vim ~/

# copy .vimrc to home folder
cp .vimrc ~/

# copy .bashrc to home folder
cp .bashrc ~/

# copy .tmux.conf to home folder
cp .tmux.conf ~/

