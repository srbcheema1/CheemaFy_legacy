#!/usr/bin/env bash
if [ "$1" = "--remove" ]
then
    echo "removing cheemafy"
    mkdir -p ~/programs/cheemafy/save_old_config
    sh ~/programs/cheemafy/myPlugins/restore_old_config.sh
fi

place=`pwd`
prog=$HOME"/programs"

#these commands are safe to execute they create folder only when
#the folders are missing, they dont harm old content
mkdir -p $prog"/python/importlib"
mkdir -p $HOME"/.srb_clip_board"

#file to hold your password
if ! [ -f ~/.pass ]
then
    i=1
    while [ $i -ne 0 ]
    do
        stty -echo
        printf "[sudo] password for $USER:" && read passwrd
        stty echo
        echo "" && echo $passwrd > ~/.pass
        sudo -k -S ls < ~/.pass > /dev/null 2>&1
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
#    stty -echo
#    printf "enter your password : " && read  passwrd
#    stty echo
#    echo ""
#    echo $passwrd > ~/.pass
fi

if ! [ $place = $prog"/cheemafy" ]
then
    echo creating cheemafy
    cp -r ../cheemafy $prog
    cd $prog"/cheemafy/"
    sh $prog"/cheemafy/myPlugins/save_old_config.sh"
    sh $prog"/cheemafy/cheemafy.sh"
    exit
fi



#here begins main cheemafy

#customise terminal
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
#gsettings list-keys  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    use-transparent-background true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    cursor-shape ibeam
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    background-color 'rgb(0,0,0)'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-columns 110
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-rows 33
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    background-transparency-percent 23
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    foreground-color 'rgb(231,238,232)'



#these commands are safe to execute .. updates the files ..
#they can only add new files to system cannot delete older ones with diff names

#copy home_files to its position
cp -r ~/programs/cheemafy/home_files/. ~/

#copy folder srbScripts to  ~/programs/srbScript
cp -r ~/programs/cheemafy/srbScripts ~/programs

#copy importlib
cp -r ~/programs/cheemafy/importlib ~/programs/python


## safe commands
#install xsel
if ! type xsel > /dev/null 2>&1;
then
    echo installing xsel
    sudo -S -k apt-get install xsel -y < ~/.pass
fi

#install vim
if ! type vim > /dev/null 2>&1;
then
    echo installing vim
    sudo -S -k apt-get install vim -y < ~/.pass
fi

sudo -S -k apt-get install vim-gnome -y < ~/.pass

#install Vundle
if ! [ -d "$HOME"/.vim/bundle/ ]
then
    #can create folder on its own
    echo installing vim bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo installing YouCompleteMe
    cp ~/programs/cheemafy/myPlugins/vim/bundle/YouCompleteMe ~/.vim/bundle/
fi

echo instaling vimSyntax
cp -r ~/programs/cheemafy/myPlugins/vim/syntax   ~/.vim/
cp -r ~/programs/cheemafy/myPlugins/vim/ftdetect ~/.vim/

#install plugins
vim hell -c ":PluginInstall" -c ":q!" -c ":q!"

echo "Thanks for using cheemafy .. your PC is configured "
#let the changes begin
#gnome-terminal -e "bash -c \"echo 'now execute sh myPlugins/term.sh' ; exec bash\"" & disown & exit
