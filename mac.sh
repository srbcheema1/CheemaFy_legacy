#!/usr/bin/env bash
if [ "$1" = "--remove" ]
then
    echo "removing CheemaFy"
    mv ~/.CheemaFy/installed_mac ~/.CheemaFy/not_installed_mac
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
    bash $prog"/CheemaFy/CheemaFy.sh"
    exit
fi



# CONFIGURING HOME FILES
printf "Do you want to configure home_files y/n : "
read ans

bashrc_content="# CheemaFy bash
    . ~/programs/CheemaFy/myPlugins/.bash_extended/mac_bash/setup_bash
"
gitconfig_content="[include]
    path = ~/.CheemaFy/installed_mac"
vimrc_content=":so ~/programs/CheemaFy/srbScripts/vim_scripts/setup.vim"
installed_content="[include]
    path = ~/programs/CheemaFy/myPlugins/git_extended/gitconfig"


echo "$installed_content" >> ~/.CheemaFy/installed_mac
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


# install brew and things
printf "Do you want to install brew y/n : "
read ans
if [ $ans = "y" ]
then
    if [[ $(command -v brew) == "" ]]; then
        echo "installing home brew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "updating home brew"
        brew update
    fi
fi

printf "Do you want to install brew tools y/n : "
read ans
if [ $ans = "y" ]
then
    brew install bash-completion
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
