#!/bin/bash

#this must be in ~/programs/CheemaFy

#cp homefiles
mkdir -p ~/programs/CheemaFy/.save_old_config/home_files
cp ~/programs/CheemaFy/.save_old_config/home_files/.bashrc ~/
cp ~/programs/CheemaFy/.save_old_config/home_files/.gitconfig ~/
cp ~/programs/CheemaFy/.save_old_config/home_files/.vimrc ~/
cp ~/programs/CheemaFy/.save_old_config/home_files/.bash_aliases ~/

#vim
mkdir -p ~/programs/CheemaFy/.save_old_config/vim_config/.vim
cp -r ~/programs/CheemaFy/.save_old_config/vim_config/.vim ~/

#cp importlib
mkdir -p ~/programs/python/importlib
mkdir -p ~/programs/srbScripts

rm -r ~/programs/python/importlib
rm -r ~/programs/srbScripts
