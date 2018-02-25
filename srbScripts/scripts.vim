" ! is used to overwrite the function if exists

function! Fun1(var1, var2)
  let str=a:var1
  let str2=a:var2
  echo str2
endfunction

"command to open new tab but ... not working yet
function! Tabopen(var1)
    :w
    execute '!gnome-terminal -e " vim -p ' . expand('%:t') . ' ' . a:var1 . ' " '
endfunction

"swap two split screens
function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction
command! Swap :call WinBufSwap()
map <Leader>s :call WinBufSwap()<CR>



nnoremap <Leader>r :execute '/zzz'<cr>:call Redraw_it()<cr>
function! Redraw_it()
    ":exe 'normal /zzz'
    :redraw!
endfunction




function! TogglePaste()
   if &paste
        :set nopaste
        :echo 'nopaste mode'
   else
      	:set paste
        :echo 'you can paste'
   endif
endfunction
nmap  <C-p>  :call TogglePaste()<CR>

"nerdtree
function! Nerdy()
    let l:tab=tabpagenr()
    :tabnew
    :tabm
    :NERDTree
    :exe "normal \<C-W>\<C-w>"
    :q!
    let g:undotab = l:tab
endfunction
nnoremap <Leader>nerd :call Nerdy()<CR>

function! EditVimrc()
    echo "enter number of file\n
                \1: vimrc \n
                \2: scripts.vim \n
                \3: programming.vim \n
                \4: tabb.vim \n
                \5: file_type.vim \n
                \"
    let l:n = getchar() - 48
    if l:n == 1
        :70vsplit ~/.vimrc
    elseif l:n == 2
        :70vsplit ~/programs/srbScripts/scripts.vim
    elseif l:n == 3
        :70vsplit ~/programs/srbScripts/programming.vim
    elseif l:n == 4
        :70vsplit ~/programs/srbScripts/tabb.vim
    elseif l:n == 5
        :70vsplit ~/programs/srbScripts/file_type.vim
    endif
endfunction
nnoremap <F3> :call EditVimrc()<cr>

nnoremap <F2> :source ~/.vimrc<cr>
            \ :source ~/programs/srbScripts/scripts.vim<cr>
            \ :source ~/programs/srbScripts/programming.vim<cr>
            \ :source ~/programs/srbScripts/tabb.vim<cr>
            \ :source ~/programs/srbScripts/file_type.vim<cr>

function! RefreshSource_()
    :source ~/programs/srbScripts/programming.vim
    :source ~/programs/srbScripts/tabb.vim
    :source ~/programs/srbScripts/file_type.vim
endfunction
:call RefreshSource_()

function! Chartest()
    let l:n = getchar()
    echo l:n
endfunction

"to avail this feature install vim-gtk
"verify it by checking
"       vim --version | grep xterm
nnoremap /p "+p

"copy commands
"   '"+' is for external clipboard
vnoremap <C-y> "+y

"to use "+p tp paste external data to editor ,,maybe there was : at begining of command
set clipboard=unnamed




"keep cursor away from top and bottom of screen
"to keep at center set value to 999
set scrolloff=4



"python in vim
function! PythonInVim()
python3 << endpython
print('hello')
endpython
endfunction

"no need to worry about caps
nmap U u
nmap Q! q!
nmap WQ wq

