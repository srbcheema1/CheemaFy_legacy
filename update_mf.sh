#!/bin/bash

#this must be in ~/programs/CheemaFy

#cp homefiles
cp ~/.bashrc       ~/programs/CheemaFy/home_files/
cp ~/.vimrc        ~/programs/CheemaFy/home_files/
cp ~/.gitconfig    ~/programs/CheemaFy/home_files/

#cp srbScripts
cp -r ~/programs/srbScripts/. ~/programs/CheemaFy/srbScripts/

#cp importlib
cp -r ~/programs/python/importlib/. ~/programs/CheemaFy/importlib/

#vim files
cp -r ~/.vim/syntax ~/programs/CheemaFy/myPlugins/vim/
cp -r ~/.vim/ftdetect ~/programs/CheemaFy/myPlugins/vim/


#cd ~/programs/CheemaFy/srbScripts
#rm $(ls | grep '.*pyc$')

extra_files=`ls ~/programs/CheemaFy/srbScripts/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm ~/programs/CheemaFy/srbScripts/*.pyc
fi

extra_files=`ls ~/programs/CheemaFy/importlib/ | grep __* | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm -r ~/programs/CheemaFy/importlib/__*
fi

extra_files=`ls ~/programs/CheemaFy/importlib/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm -r ~/programs/CheemaFy/importlib/*.pyc
fi

