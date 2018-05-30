if !empty(glob("~/.CheemaFy/installed"))
   :so ~/programs/CheemaFy/srbScripts/vim_scripts/vimrc.vim
endif

if !empty(glob("~/.CheemaFy/installed_mac"))
   :so ~/programs/CheemaFy/srbScripts/vim_scripts/vimrc.vim

   "copy paste
   "intall vim in mac using
   "brew install vim --with-server-clinnet
    set clipboard=unnamed " copy to the system clipboard
    vmap <C-y> y:call system("pbcopy", getreg("\""))<CR>
    " to paste use <Command>v

    "backspace problem
    set backspace=indent,eol,start
endif

if !empty(glob("~/.CheemaFy/installed_win"))
   :so ~/programs/CheemaFy/srbScripts/vim_scripts/vimrc.win

    "backspace problem
    set backspace=indent,eol,start
endif
