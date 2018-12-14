#!/bin/bash

#this must be in ~/programs/CheemaFy

#cp homefiles
mkdir -p ~/.CheemaFy/save_old_config/home_files

if [ -f ~/.CheemaFy/save_old_config/home_files/.bashrc ]; then
    cp ~/.CheemaFy/save_old_config/home_files/.bashrc ~/
fi
if [ -f ~/.CheemaFy/save_old_config/home_files/.gitconfig ]; then
    cp ~/.CheemaFy/save_old_config/home_files/.gitconfig ~/
fi
if [ -f ~/.CheemaFy/save_old_config/home_files/.vimrc ]; then
    cp ~/.CheemaFy/save_old_config/home_files/.vimrc ~/
fi

#vim
mkdir -p ~/.CheemaFy/save_old_config/vim_config/.vim
cp -r ~/.CheemaFy/save_old_config/vim_config/.vim ~/
