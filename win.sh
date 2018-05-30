#!/usr/bin/env bash
if [ "$1" = "--remove" ]
then
    echo "removing CheemaFy"
    mv ~/.CheemaFy/installed_win ~/.CheemaFy/not_installed_win
    exit
fi


place=`pwd`
prog=$HOME"/programs"
#these commands are safe to execute they create folder only when
#the folders are missing, they dont harm old content
mkdir -p $prog
mkdir -p $HOME"/.CheemaFy/srb_clip_board"

if ! [ $place = $prog"/CheemaFy" ]
then
    echo creating CheemaFy
    cp -r ../CheemaFy $prog
    cd $prog"/CheemaFy/"
    bash $prog"/CheemaFy/CheemaFy.sh"
    exit
fi



# CONFIGURING HOME FILES
printf "Do you want to configure home_files y/n : "
read ans

bashrc_content="# CheemaFy bash
    . ~/programs/CheemaFy/myPlugins/bash_extended/win_bash/setup_bash
"
gitconfig_content="[include]
    path = ~/.CheemaFy/installed_win"
vimrc_content=":so ~/programs/CheemaFy/srbScripts/vim_scripts/setup.vim"
installed_content="[include]
    path = ~/programs/CheemaFy/myPlugins/git_extended/gitconfig
    path = ~/programs/CheemaFy/myPlugins/git_extended/srbconfig"


echo "$installed_content" >> ~/.CheemaFy/installed_win
if [ $ans = "y" ]
then
    echo "$vimrc_content" >> ~/.vimrc
    echo "$bashrc_content" >> ~/.bash_profile
    echo "$gitconfig_content" >> ~/.gitconfig
fi
if [ $ans = "Y" ]
then
    echo "$vimrc_content" > ~/.vimrc
    echo "$bashrc_content" > ~/.bash_profile
    echo "$gitconfig_content" > ~/.gitconfig
fi




#install Vundle
if ! [ -d "$HOME"/.vim/bundle/ ]
then
    echo installing vim bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo instaling vimSyntax
cp -r ~/programs/CheemaFy/myPlugins/vim/syntax   ~/.vim/
cp -r ~/programs/CheemaFy/myPlugins/vim/ftdetect ~/.vim/



printf "Do you want to add vim plugins y/n : "
read ans

if [ $ans = "y" ]
then
    vim hell -c ":PluginInstall" -c ":q!" -c ":q!"
    ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
fi

echo 'Thanks for using CheemaFy'
