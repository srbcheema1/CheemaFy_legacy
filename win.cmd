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

exit /b

if not %userprofile%\.CheemaFy mkdir %userprofile%\.CheemaFy
if not %userprofile%\.CheemaFy\srb_clip_board mkdir %userprofile%\.CheemaFy\srb_clip_board

set /p ans=Do you want to configure home_files y/n :

if "%ans%" == "y" (
    set installed_content=[include]
    echo %installed_content% > %userprofile%\.CheemaFy\installed_win
    set installed_content=    path = ~/programs/CheemaFy/myPlugins/git_extended/gitconfig
    echo %installed_content% >> %userprofile%\.CheemaFy\installed_win
    set installed_content=    path = ~/programs/CheemaFy/myPlugins/git_extended/srbconfig
    echo %installed_content% >> %userprofile%\.CheemaFy\installed_win

    set vimrc_content=:so ~/programs/CheemaFy/srbScripts/vim_scripts/setup.vim
    echo %vimrc_content% >> %userprofile%\.vimrc

    set gitconfig_content=[include]
    echo %gitconfig_content% >> %userprofile%\.gitconfig
    set gitconfig_content=    path = ~/.CheemaFy/installed_win
    echo %gitconfig_content% >> %userprofile%\.gitconfig
)

if not exist %userprofile%\.vim\bundle\nul (
    echo installing vim bundle
    git clone https://github.com/gmarik/Vundle.vim.git %userprofile%\.vim\bundle\Vundle.vim
)


echo instaling vimSyntax
xcopy /e/i %userprofile%\programs\CheemaFy\myPlugins\vim\syntax   %userprofile%\.vim\syntax
xcopy /e/i %userprofile%\programs\CheemaFy\myPlugins\vim\ftdetect %userprofile%\.vim\ftdetect

echo please install vim plugins using :PluginInstall
echo Thanks for using CheemaFy
