#!/bin/bash

#this must be in ~/programs/myfiles

#cp homefiles
cp ~/.bashrc       ~/programs/myfiles/home_files/
cp ~/.bash_aliases ~/programs/myfiles/home_files/
cp ~/.vimrc        ~/programs/myfiles/home_files/
cp ~/.gitconfig    ~/programs/myfiles/home_files/

#cp srbScripts
cp -r ~/programs/srbScripts/. ~/programs/myfiles/srbScripts/

#cp importlib
cp -r ~/programs/python/importlib/. ~/programs/myfiles/importlib/
