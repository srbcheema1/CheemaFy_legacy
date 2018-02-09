#!/bin/bash

#this must be in ~/programs/cheemafy

#cp homefiles
mkdir -p ~/programs/cheemafy/save_old_config/home_Files
cp ~/programs/cheemafy/save_old_config/home_files/.bashrc ~/
cp ~/programs/cheemafy/save_old_config/home_files/.gitconfig ~/
cp ~/programs/cheemafy/save_old_config/home_files/.vimrc ~/
cp ~/programs/cheemafy/save_old_config/home_files/.bash_aliases ~/

#vim
mkdir -p ~/programs/cheemafy/save_old_config/vim_config/.vim
cp ~/programs/cheemafy/save_old_config/vim_config/.vim ~/

#cp importlib
mkdir -p ~/programs/python/importlib
mkdir -p ~/programs/srbScripts

rm -r ~/programs/python/importlib
rm -r ~/programs/srbScripts
