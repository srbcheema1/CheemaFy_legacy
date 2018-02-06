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

#vim files
cp -r ~/.vim/syntax ~/programs/myfiles/myPlugins/vim/
cp -r ~/.vim/ftdetect ~/programs/myfiles/myPlugins/vim/


#cd ~/programs/myfiles/srbScripts
#rm $(ls | grep '.*pyc$')

extra_files=`ls ~/programs/myfiles/srbScripts/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm ~/programs/myfiles/srbScripts/*.pyc
fi

extra_files=`ls ~/programs/myfiles/importlib/ | grep pyc | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm ~/programs/myfiles/importlib/*.pyc
fi

extra_files=`ls ~/programs/myfiles/importlib/ | grep __* | wc -l`
if [ "$extra_files" -gt 0 ]
then
    rm -r ~/programs/myfiles/importlib/__*
fi
