#!/usr/bin/env bash
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
    sh $prog"/CheemaFy/myPlugins/save_old_config.sh"
    sh $prog"/CheemaFy/CheemaFy.sh"
    exit
fi

#copy home_files to its position
cp -r ~/programs/CheemaFy/home_files/. ~/
touch ~/.bash_profile
lines_in_bash_profile="if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi"
echo "$lines_in_bash_profile" > ~/.bash_profile



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
