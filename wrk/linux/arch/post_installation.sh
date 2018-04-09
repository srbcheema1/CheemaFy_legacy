sudo pacman -Syu
sudo pacman -S wpa_supplicant wireless_tools networkmanager network-manager-applet

sudo pacman -S base-devel python python3 gcc firefox bash-completion lsb_release
sudo pacman -S ntfs-3g
sudo pacman -S xsel gvim cmake xdotool wmctrl tilda tree clang boost boost-libs

systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service
systemctl start NetworkManager.service


printf "Do you want to install yaourt y/n : "
read ans
if [ $ans = "y" ]
then
    # install yaourt
    yaourt_lines="
    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch
    "

    sudo echo "$yaourt_lines" >> /etc/pacman.conf

    sudo pacman -Syu yaourt
    yaourt -Syu downgrade
fi
