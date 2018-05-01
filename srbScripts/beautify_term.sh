# run it without sudo
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
#gsettings list-keys  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    cursor-shape ibeam
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    background-color 'rgb(44,44,44)' #333333
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-columns 110
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    default-size-rows 33
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
    foreground-color 'rgb(222,222,222)'




# I removed these settings as they are not  in new gnome, so they cause problem in arch.
# they work only in ubuntu
# not in arch as it has updated gnome.
# I will soon figure something out as I love transparent terminal

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


