" Vim syntax file
" Language: wrk
" Maintainer: srbcheema1


if exists("b:current_syntax")
  finish
endif



"syntax includes region , match , keyword


let b:current_syntax = "cel"

syn keyword wrkfile NOTE sexy

"comment 
syn match celComment "#.*$"



" Integer with - + or nothing in front
syn match celNumber '\d\+'
syn match celNumber '[-+]\d\+'

" Floating point number with decimal no E or e 
syn match celNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'



"transparent allows vim to color inside this reason also 
"fold tells vim to treat it as a fold
syn region celDescBlock start="{" end="}" fold transparent contains=celNumber,celComment




"hi def link celTodo        Todo
"hi def link celComment     Comment
"hi def link celBlockCmd    Statement
"hi def link celHip         Type
"hi def link celString      Constant
"hi def link celDesc        PreProc
"hi def link celNumber      Constant


hi def link celComment     Comment
hi def link celNumber      Constant


"shift 1
syn match sh1 "\s\s\s\s.*\n"
hi sh1 ctermbg=darkgrey ctermfg=yellow

"heading1
syn region h1 start="----" end="\n"
hi h1 ctermbg=black ctermfg=green

