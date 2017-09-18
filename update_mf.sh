#!/bin/sh

#this must be in ~/programs/myfiles

#cp .vimrc .bash_aliases .bashrc
cp ~/.bashrc       ~/programs/myfiles/home_files/
cp ~/.bash_aliases ~/programs/myfiles/home_files/
cp ~/.vimrc        ~/programs/myfiles/home_files/

#cp srbScripts 
cp -r ~/programs/srbScripts/. ~/programs/myfiles/srbScripts/
