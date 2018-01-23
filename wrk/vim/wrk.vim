" Vim syntax file
" Language: wrk
" Maintainer: srbcheema1


if exists("b:current_syntax")
  finish
endif



"syntax includes region , match , keyword


let b:current_syntax = "wrk"

"Keywords
syn keyword wrkKeyword NOTE sexy
hi wrkKeyword ctermfg=red

"comment 
syn match wrkComment "#.*$" contains=wrkKeyword
syn match wrkComment "//.*$" contains=wrkKeyword
syn match wrkComment '^"[^"]*$' contains=wrkKeyword



" Integer with - + or nothing in front
syn match wrkNumber '\d\+'
syn match wrkNumber '[-+]\d\+'

" Floating point number with decimal no E or e 
syn match wrkNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match wrkNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match wrkNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match wrkNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match wrkNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'



"transparent allows vim to color inside this reason also 
"fold tells vim to treat it as a fold
syn region wrkDescBlock start="{" end="}" fold transparent contains=wrkNumber,wrkComment



"hi def link wrkTodo        Todo
"hi def link wrkComment     Comment
"hi def link wrkBlockCmd    Statement
"hi def link wrkHip         Type
"hi def link wrkString      Constant
"hi def link wrkDesc        PreProc
"hi def link wrkNumber      Constant


hi def link wrkComment     Comment
hi def link wrkNumber      Constant





"shift 1
syn match sh1 "^\s\s\s\s.*\n" contains=wrkComment
hi sh1 ctermbg=darkgrey ctermfg=lightgrey

"heading1
syn region h1 start="----" end="\n"
hi h1 ctermbg=black ctermfg=green

