map <F7> :!g++ % && ./a.out <CR>

function! CreateIn()
    :let temp = system('echo "`xsel -b`" > in')
    :echo 'made in'
endfunction
nnoremap <Leader>i :call CreateIn()<cr>

function! CreateOut()
    :let temp = system('echo "`xsel -b`" > out')
    :echo "made out"
endfunction
nnoremap <Leader>o :call CreateOut()<cr>


let res = ""
function! Compile()
    let _ext = expand('%:e')
    if l:_ext == "cpp"
        :w
        :let g:res = system('g++ -std=c++11 ' . expand('%:t'))
        if g:res == ""
            :echo 'perfectly compiled'
        else
            :echo g:res
        endif
    endif
endfunction
nnoremap <Leader>c :call Compile()<cr>

let res = ""
function! NewTerm()
        :let g:res = system('gnome-terminal & disown')
endfunction
nnoremap <Leader>term :call NewTerm()<cr>


function! Play()
    let _ext = expand('%:e')
    if l:_ext == "cpp"
        :w
        :let g:res = system('vim_test.py')
        :echo g:res
    endif
endfunction
command! Run :call Play()
nnoremap <Leader>p :call Play()<cr>

function! CodeBeauty()
    :%s/\s\+$//e
    let _ext = expand('%:e')
    if l:_ext == "cpp"
        :%s/\/\/\s\@!/\0\1 /gce
    elseif l:_ext == "py"
        :%s/\#\s\@!/\0 /gce
    elseif l:_ext == "sh"
        :%s/\#\s\@!/\0 /gce
    elseif l:_ext == "wrk"
        :%s/\#\s\@!/\0 /gce
    endif
endfunction
"Remove all trailing whitespace by pressing F5
"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:call CodeBeauty()
nnoremap <F5> :call CodeBeauty()<cr>


"to compile python and show results
"map <F9> :!python3 % 2>&1 \| tee /tmp/results<cr>:vsplit /tmp/results<cr>
