"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Vundle code
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
"end Vundle code

set autoindent
set smartindent

set shiftwidth=4
set expandtab
set tabstop=4

"set cursor line
hi CursorLine   cterm=NONE ctermbg=darkgrey 
set cursorline! 

"comments in cpp
map <C-c> :s/^/\/\//<Enter>
map <C-u> :s/^\/\///<Enter>

set nu
"relative numbering in lines
set relativenumber

"fold code
set foldlevel=0
normal zR


"copy commands
"   '"+' is for external clipboard 
vnoremap <C-y> "+y

"keep script
:so ~/programs/srbScripts/vimScript

