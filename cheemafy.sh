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

if ! [ -d $HOME"/.srb_clip_board" ]
then
    mkdir $HOME"/.srb_clip_board"
fi

#file to hold your password
if ! [ -f ~/.pass ]
then
    stty -echo
    printf "enter your password : " && read  passwrd
    stty echo
    echo ""
    echo $passwrd > ~/.pass
fi

if ! [ $place = $prog"/myfiles" ]
then
    echo "copying it to right place and running from there"
    cp -r ../myfiles $prog
    cd $prog"/myfiles/"
    sh $prog"/myfiles/cheemafy.sh"
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
    background-color 'rgb(14,1,1)'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-columns 110
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-rows 33
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    background-transparency-percent 31
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    foreground-color 'rgb(231,238,232)'


#copy home_files to its position
cp -r ~/programs/myfiles/home_files/. ~/

#copy folder srbScripts to  ~/programs/srbScript
cp -r ~/programs/myfiles/srbScripts ~/programs/

#copy importlib
cp -r ~/programs/myfiles/importlib ~/programs/python/

#install xsel
if ! type vim > /dev/null 2>&1;
then
    sudo apt-get install xsel
fi

#install vim
if ! type vim > /dev/null 2>&1;
then
    sudo apt-get install vim
fi

#install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#plugins
plugin_path=$HOME/.vim/bundle
if [ -d $plugin_path ]
then
    echo "vim plugins already there"
else
    echo "copying vim plugins"
    cp -r ~/programs/myfiles/myPlugins/vim/. ~/.vim/
fi

#let the changes begin
gnome-terminal & disown & exit
