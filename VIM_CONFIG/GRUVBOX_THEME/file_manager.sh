#!/bin/bash


mkdir -p ~/Documents/VIM_CONFIG.old
BACKUP_DIR=~/Documents/VIM_CONFIG.old


echo "=============== Dear $USER ========================="
echo " this will change your vim config file "
echo " if you want your config back please check in "
echo " $BACKUP_DIR "
echo " ===================================================="


if [[ -d ~/TEMP_FILES ]] && [[ -n `ls -A ~/TEMP_FILES` ]]; then 

    # copy zsh config to /usr/share
    sudo cp -r ~/TEMP_FILES/my_zsh/ZSH/zsh /usr/share
    sudo cp -r ~/TEMP_FILES/my_zsh/ZSH/zsh-theme-powerlevel10k /usr/share
    
fi
# create dir in user home 
mkdir -p  ~/TEMP_FILES

# cd into dir
pushd ~/TEMP_FILES 

# clone zsh theme
git clone https://gitlab.com/farookphuket/my_zsh.git 

ZSH_DIR=~/TEMP_FILES/my_zsh/ZSH

cp $ZSH_DIR/.zshrc ~/

# copy zsh config to /usr/share
sudo cp -r $ZSH_DIR/zsh /usr/share
sudo cp -r $ZSH_DIR/zsh-theme-powerlevel10k /usr/share

sleep 5s 







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

