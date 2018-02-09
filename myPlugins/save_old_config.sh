#!/bin/bash

#this must be in ~/programs/cheemafy

#cp homefiles
mkdir -p ~/programs/cheemafy/save_old_config/home_files

touch ~/.bashrc
touch ~/.bash_aliases
touch ~/.vimrc
touch ~/.gitconfig

cp ~/.bashrc       ~/programs/cheemafy/save_old_config/home_files/
cp ~/.bash_aliases ~/programs/cheemafy/save_old_config/home_files/
cp ~/.vimrc        ~/programs/cheemafy/save_old_config/home_files/
cp ~/.gitconfig    ~/programs/cheemafy/save_old_config/home_files/


#vim files
mkdir -p ~/.vim
mkdir -p ~/programs/cheemafy/save_old_config/vim_config

cp -r ~/.vim ~/programs/cheemafy/save_old_config/vim_config/
