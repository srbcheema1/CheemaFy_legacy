#!/bin/bash
#this file must be in ~/programs/myfiles/

#copy home_files to its position
cp -r ~/programs/myfiles/home_files/. ~/ 

#copy folder srbScripts to  ~/programs/srbScript
cp -r ~/programs/myfiles/srbScripts ~/programs/

#plugins
plugin_path=$HOME/.vim/bundle
if [ -d $plugin_path ]
then
    echo "vim plugins already there"
else
    echo "copying vim plugins"
    cp -r ~/programs/myfiles/myPlugins/vim/. ~/.vim/
fi

