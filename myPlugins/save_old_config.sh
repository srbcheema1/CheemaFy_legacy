#!/bin/bash

#this must be in ~/programs/CheemaFy

#cp homefiles
mkdir -p ~/programs/CheemaFy/.save_old_config/home_files

touch ~/.bashrc
touch ~/.vimrc
touch ~/.gitconfig

cp ~/.bashrc       ~/programs/CheemaFy/.save_old_config/home_files/
cp ~/.vimrc        ~/programs/CheemaFy/.save_old_config/home_files/
cp ~/.gitconfig    ~/programs/CheemaFy/.save_old_config/home_files/


#vim files
mkdir -p ~/.vim
mkdir -p ~/programs/CheemaFy/.save_old_config/vim_config

cp -r ~/.vim ~/programs/CheemaFy/.save_old_config/vim_config/
