#! /bin/bash
place=`pwd`
echo $place

prog=$HOME"/programs"
echo $prog

if ! [ -d $prog ]
then
    mkdir $prog
fi

if ! [ -d $prog"/python" ]
then
    mkdir $prog"/python"
fi

if ! [ -d $prog"/python/" ]
then
    mkdir $prog"/python/importlib"
fi

if ! [ -d "~/.srb_clip_board" ]
then
    mkdir "~/.srb_clip_board"
fi

if ! [ $place = $prog"/myfiles" ]
then
    echo "copying it to right place and running from there"
    cp ../myfiles $prog
    sh $prog"/myfiles/cheemafy.sh"
    exit
fi

#here begins main cheemafy

#copy home_files to its position
cp -r ~/programs/myfiles/home_files/. ~/

#copy folder srbScripts to  ~/programs/srbScript
cp -r ~/programs/myfiles/srbScripts ~/programs/

#copy importlib
cp -r ~/programs/myfiles/importlib ~/programs/python/

#plugins
plugin_path=$HOME/.vim/bundle
if [ -d $plugin_path ]
then
    echo "vim plugins already there"
else
    echo "copying vim plugins"
    cp -r ~/programs/myfiles/myPlugins/vim/. ~/.vim/
fi

