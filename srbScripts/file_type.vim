"comments in diff files
function! CommentSetter()
    let _ext = expand('%:e')
    if l:_ext == "py" || l:_ext == "sh"
    endif
    if l:_ext == "vim"
    endif
endfunction
call CommentSetter()

function! File_html()
    set shiftwidth=2
    set tabstop=2
    set foldmethod=manual
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','%':'%'}
endfunction

function! File_cpp()
    map <C-c> :s!^!//<Enter>
    map <C-u> :s!^//!!<Enter>
    set foldmethod=syntax
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
endfunction

function! File_py()
    map <C-c> :s!^!#<Enter>
    map <C-u> :s!^#!!<Enter>
    set foldmethod=manual
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
endfunction

function! File_sh()
    map <C-c> :s!^!#<Enter>
    map <C-u> :s!^#!!<Enter>
    set foldmethod=manual
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
endfunction

function! File_vim()
    map <C-c> :s!^!"<Enter>
    map <C-u> :s!^"!!<Enter>
    set foldmethod=manual
    let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
endfunction

function! Printfile()
    :echo 'file name : 'expand('%:t')
    :echo 'file extn : 'expand('%:e')
endfunction

"file type checker
function! File_type()
    set shiftwidth=4
    set tabstop=4
    let _ext = expand('%:e')
    if l:_ext == "html"
        :call File_html()
    elseif l:_ext == "cpp"
        :call File_cpp()
    elseif l:_ext == "py"
        :call File_py()
    elseif l:_ext == "vim"
        :call File_vim()
    elseif l:_ext == "sh"
        :call File_sh()
    endif
    "nerd Commenter
    map <C-c> <Leader>cc
    map <C-u> <Leader>cu
endfunction
call File_type()
