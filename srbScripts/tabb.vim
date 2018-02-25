
let g:undotab = 1
"Switch Tab
function! TabJump()
    let l:tab=tabpagenr()
    let l:n = getchar()
    if l:n == 99
        :tabc
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 108
        :tabl
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 114
        :tabr
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 112
        :tabp
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 110
        :tabn
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 109
        :tabm
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 48
        :tabmove 0
        :call File_type()
        let g:undotab = l:tab
        return
    endif
    if l:n == 117
        :tabr
        let c = 1
        while c <= g:undotab - 1
          :tabn
          let c += 1
        endwhile
        :call File_type()
        let g:undotab = l:tab
        return
    endif

    :tabr
    let c = 1
    while c <= l:n - 49
      :tabn
      let c += 1
    endwhile
    :call File_type()
    let g:undotab = l:tab
endfunction
nnoremap tab :call TabJump()<cr>

function! CloseTabs()
    let l:tab=tabpagenr()
    :tabmove 0 "dont know why but to move tab to pos 1 we have to write 0
    :tabl
    let c = 1
    while c <= l:tab
      :tabc
      let c += 1
    endwhile
endfunction
