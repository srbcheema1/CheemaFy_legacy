~/.vim/ftdetect][505]% cat jak.vim
au BufRead, BufNewFile *.jak set filetype=jak

syn region JakeSubtitle start=+==+ end=+==+
highlight JakeSubtitle ctermbg=black ctermfg=DarkMagenta

syn region JakeTitle start=+===+ end=+===+
highlight JakeTitle ctermbg=black ctermfg=yellow

syn region JakeMasterTitle start=+====+ end=+====+
highlight JakeMasterTitle cterm=bold term=bold ctermbg=black ctermfg=LightBlue

syn region emphasis start=+<em>+ end=+</em>+
highlight emphasis ctermbg=black ctermfg=yellow

" makes all of the numbered items bold."
" (this works I just don't like the effect.  Decided to change to just highlight the "number)
"syn region numberedItem start=+^\t*\d*)+ end=+\n+"
syn match numberedItem +^\t*\d*)+
highlight numberedItem cterm=bold
