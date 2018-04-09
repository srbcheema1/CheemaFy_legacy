#!/usr/bin/env bash
place=`pwd`
prog=$HOME"/programs"

#these commands are safe to execute they create folder only when
#the folders are missing, they dont harm old content
mkdir -p $prog"/python/importlib"
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


#here begins main CheemaFy

#customise terminal
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
#gsettings list-keys  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    cursor-shape ibeam
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    background-color 'rgb(0,0,0)'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-columns 126
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-rows 33
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    foreground-color 'rgb(231,238,232)'

"
 I removed these settings as they are not  in new gnome, so they cause problem in arch.
 they work only in ubuntu
 not in arch as it has updated gnome.
 I will soon figure something out as I love transparent terminal
"
__linux=`lsb_release -i`
IFS=':'
read -ra _linux <<< "$__linux"
__linux=${_linux[1]}
if [ "$__linux" = "	Ubuntu" ]
then
    echo "in ubuntu"
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
        use-transparent-background true
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
        background-transparency-percent 3
fi



#copy files to their position
cp -r ~/programs/CheemaFy/home_files/. ~/
cp -r ~/programs/CheemaFy/srbScripts ~/programs
cp -r ~/programs/CheemaFy/importlib ~/programs/python

sudo pacman -Syu
sudo pacman -S xsel gvim cmake xdotool wmctrl tilda tree clang boost boost-libs


#install Vundle
if ! [ -d "$HOME"/.vim/bundle/ ]
then
    #can create folder on its own
    echo installing vim bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo installing YouCompleteMe
    cp ~/programs/CheemaFy/myPlugins/vim/bundle/YouCompleteMe ~/.vim/bundle/
fi

echo instaling vimSyntax
cp -r ~/programs/CheemaFy/myPlugins/vim/syntax   ~/.vim/
cp -r ~/programs/CheemaFy/myPlugins/vim/ftdetect ~/.vim/


# install vim plugins
if [ $ans = "y" ]
then
    vim hell -c ":PluginInstall" -c ":q!" -c ":q!"
    ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
fi

echo 'Thanks for using CheemaFy'
