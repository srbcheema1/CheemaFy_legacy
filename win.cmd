@echo off
if "%1" == "--remove" (
    echo removing CheemaFy
    move %userprofile%\.CheemaFy\installed_win %userprofile%\.CheemaFy\not_installed_win
    exit
)

set place=%cd%
echo %place%

if not "%place%" == "%userprofile%\programs\CheemaFy" (
    echo creating CheemaFy
    xcopy /e/i ../CheemaFy %userprofile%\programs\CheemaFy
)


if not exist %userprofile%\.CheemaFy mkdir %userprofile%\.CheemaFy
if not exist %userprofile%\.CheemaFy\srb_clip_board mkdir %userprofile%\.CheemaFy\srb_clip_board

set /p ans=Do you want to configure home_files y/n :

if "%ans%" == "y" (
    set installed_content1=[include]
    echo %installed_content1% 1> %userprofile%\.CheemaFy\installed_win
    set installed_content2=    path = ~/programs/CheemaFy/myPlugins/git_extended/gitconfig
    echo %installed_content2% 1>> %userprofile%\.CheemaFy\installed_win
    set installed_content3=    path = ~/programs/CheemaFy/myPlugins/git_extended/srbconfig
    echo %installed_content3% 1>> %userprofile%\.CheemaFy\installed_win

    ::here space befor colon is necessary else it will keep on printing echo is off
    set vimrc_content1= :so ~/programs/CheemaFy/srbScripts/vim_scripts/setup.vim
    echo %vimrc_content1% 1>> %userprofile%\.vimrc

    set gitconfig_content1=[include]
    echo %gitconfig_content1% 1>> %userprofile%\.gitconfig
    set gitconfig_content2=    path = ~/.CheemaFy/installed_win
    echo %gitconfig_content2% 1>> %userprofile%\.gitconfig
)

if not exist %userprofile%\.vim\bundle\nul (
    echo installing vim bundle
    git clone https://github.com/gmarik/Vundle.vim.git %userprofile%\.vim\bundle\Vundle.vim
    echo instaling vimSyntax
    xcopy /e/i %userprofile%\programs\CheemaFy\myPlugins\vim\syntax   %userprofile%\.vim\syntax
    xcopy /e/i %userprofile%\programs\CheemaFy\myPlugins\vim\ftdetect %userprofile%\.vim\ftdetect
)



echo please install vim plugins using :PluginInstall
echo please add '%userprofile%\programs\CheemaFy\myPlugins\windows_extended' to your PATH
echo Thanks for using CheemaFy
