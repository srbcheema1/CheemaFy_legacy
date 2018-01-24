" ! is used to overwrite the function if exists

function! Fun1(var1, var2)
  let str=a:var1
  let str2=a:var2
  echo str2
endfunction


"comments in diff files
function! CommentSetter()
    map <C-c> :s!^!//<Enter>
    map <C-u> :s!^//!!<Enter>
    let _ext = expand('%:e')
    if l:_ext == "py"
        map <C-c> :s!^!#<Enter>
        map <C-u> :s!^#!!<Enter>
    endif
endfunction
call CommentSetter()

function! Printfile()
    :echo 'file name : 'expand('%:t')
    :echo 'file extn : 'expand('%:e')
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



nnoremap <Leader>r :call Redraw_it()<cr>
function! Redraw_it()
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

