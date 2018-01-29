"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Vundle code
set nocompatible                    " be iMproved, required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'       "vundle
Plugin 'Valloric/YouCompleteMe'     "auto complete
Plugin 'alvan/vim-closetag'         "close html tags
Plugin 'jiangmiao/auto-pairs'       "auto complete pairs of '' []  {}
Plugin 'vim-scripts/ZoomWin'        "zoom into a window
Plugin 'bronson/vim-trailing-whitespace' "causes all trailing whitespace to be highlighted in red
Plugin 'terryma/vim-multiple-cursors'
"https://github.com/vim-scripts/Conque-Shell
call vundle#end()                   " required
filetype plugin indent on           " required
"end Vundle code

set autoindent
set smartindent

set shiftwidth=4
set expandtab
set tabstop=4

"set cursor line
hi CursorLine   cterm=NONE ctermbg=darkgrey
set cursorline!

set nu
"relative numbering in lines
set relativenumber

"fold code
set foldlevel=0
normal zR

"keep cursor away from top and bottom of screen
"to keep at center set value to 999
set scrolloff=4

"use mouse in vim
set mouse=a

"set color to 256
set t_Co=256

"used to make l key to move to next line after end of line
"used to make h key to move to upper line after begining of line
"set whichwrap+=h,l


"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>





"HTML TAGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"Auto close brackets
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

"CTAGS
set autochdir
set tags=tags "actually you have to mention location of tags file here








"keep script
:so ~/programs/srbScripts/scripts.vim
:so ~/programs/srbScripts/programming.vim
