#!/usr/bin/env bash
if [ "$1" = "--remove" ]
then
    echo "removing CheemaFy"
    sh ~/programs/CheemaFy/srbScripts/restore_old_config.sh
    rm ~/.CheemaFy/installed
    exit
fi

place=`pwd`
prog=$HOME"/programs"
#these commands are safe to execute they create folder only when
#the folders are missing, they dont harm old content
mkdir -p $prog
mkdir -p $HOME"/.CheemaFy/srb_clip_board"

#file to hold your password
if ! [ -f ~/.CheemaFy/.pass ]
then
    i=1
    while [ $i -ne 0 ]
    do
        stty -echo
        printf "[sudo] password for $USER:" && read passwrd
        stty echo
        echo "" && echo $passwrd > ~/.CheemaFy/.pass
        sudo -k -S ls < ~/.CheemaFy/.pass > /dev/null 2>&1
        i=$?
        if [ $i -ne 0 ]
        then
            sleep 1
            if [ -f ~/dead.letter ]
            then
                rm ~/dead.letter
            fi
            echo "[sudo], try again."
        fi
    done
fi


if ! [ $place = $prog"/CheemaFy" ]
then
    echo creating CheemaFy
    cp -r ../CheemaFy $prog
    cd $prog"/CheemaFy/"
    sh $prog"/CheemaFy/srbScripts/save_old_config.sh"
    bash $prog"/CheemaFy/CheemaFy.sh"
    exit
fi



# CONFIGURING hOME FILES
printf "Do you want to configure home_files y/n : "
read ans

lines_in_bash_profile="if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi"

bashrc_content="# CheemaFy bash
if [ -f ~/.CheemaFy/installed ]; then
    if [ -f ~/programs/CheemaFy/myPlugins/bash_extended/bash_extended ]; then
        . ~/programs/CheemaFy/myPlugins/bash_extended/setup_bash
    fi
fi"
gitconfig_content="[include]
    path = ~/.CheemaFy/installed"
vimrc_content=":so ~/programs/CheemaFy/srbScripts/vim_scripts/setup.vim"
installed_content="[include]
    path = ~/programs/CheemaFy/myPlugins/git_extended/gitconfig"


echo "$installed_content" >> ~/.CheemaFy/installed
if [ $ans = "y" ]
then
    echo "$vimrc_content" >> ~/.vimrc
    echo "$bashrc_content" >> ~/.bashrc
    echo "$gitconfig_content" >> ~/.gitconfig
    echo "$lines_in_bash_profile" >> ~/.bash_profile
fi
if [ $ans = "Y" ]
then
    echo "$vimrc_content" > ~/.vimrc
    echo "$bashrc_content" > ~/.bashrc
    echo "$gitconfig_content" > ~/.gitconfig
    echo "$lines_in_bash_profile" > ~/.bash_profile
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
