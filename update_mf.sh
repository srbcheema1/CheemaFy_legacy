#!/bin/bash

#this must be in ~/programs/cheemafy

#cp homefiles
cp ~/.bashrc       ~/programs/cheemafy/home_files/
cp ~/.bash_aliases ~/programs/cheemafy/home_files/
cp ~/.vimrc        ~/programs/cheemafy/home_files/
cp ~/.gitconfig    ~/programs/cheemafy/home_files/

#cp srbScripts
cp -r ~/programs/srbScripts/. ~/programs/cheemafy/srbScripts/

#cp importlib
cp -r ~/programs/python/importlib/. ~/programs/cheemafy/importlib/

#vim files
cp -r ~/.vim/syntax ~/programs/cheemafy/myPlugins/vim/
cp -r ~/.vim/ftdetect ~/programs/cheemafy/myPlugins/vim/


#cd ~/programs/cheemafy/srbScripts
#rm $(ls | grep '.*pyc$')

extra_files=`ls ~/programs/cheemafy/srbScripts/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm ~/programs/cheemafy/srbScripts/*.pyc
fi

extra_files=`ls ~/programs/cheemafy/importlib/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm ~/programs/cheemafy/importlib/*.pyc
fi

extra_files=`ls ~/programs/cheemafy/importlib/ | grep __* | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm -r ~/programs/cheemafy/importlib/__*
fi
