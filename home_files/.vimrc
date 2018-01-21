"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Vundle code
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
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

"to use "+p tp paste external data to editor
:set clipboard=unnamed





"HTML TAGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"Auto close brackets 
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
