#!/bin/bash

#this must be in ~/programs/CheemaFy

#cp homefiles
mkdir -p ~/.CheemaFy/save_old_config/home_files

touch ~/.bashrc
touch ~/.vimrc
touch ~/.gitconfig

cp ~/.bashrc       ~/.CheemaFy/save_old_config/home_files/
cp ~/.vimrc        ~/.CheemaFy/save_old_config/home_files/
cp ~/.gitconfig    ~/.CheemaFy/save_old_config/home_files/


#vim filesj
mkdir -p ~/.vim
mkdir -p ~/.CheemaFy/save_old_config/vim_config

cp -r ~/.vim ~/.CheemaFy/save_old_config/vim_config/ > /dev/null 2>&1

cd ~/.CheemaFy/save_old_config
if ! [ -d ".git" ]
then
    echo "initilizing git repo"
    git init
fi
git add .
cur_date=`date +%d-%m-%Y_%H:%M:%S_commit`
git commit -m "$cur_date"
cd -
