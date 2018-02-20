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
