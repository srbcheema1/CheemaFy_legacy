"Vundle code
set nocompatible                    		"be iMproved, required
filetype on                        		"required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'srbcheema1/vim-markdown'       		"maarkdown plugin
    Plugin 'VundleVim/Vundle.vim'       		"vundle
    Plugin 'Valloric/YouCompleteMe'     		"auto complete
    Plugin 'bronson/vim-trailing-whitespace'	"causes all trailing whitespace to be highlighted in red
    Plugin 'jiangmiao/auto-pairs'       		"auto complete pairs of '' []  {}
    Plugin 'scrooloose/nerdcommenter'           "commentin
    Plugin 'scrooloose/nerdtree' 				"file explorer


    "sexy plugin for cpp
    Plugin 'rhysd/vim-clang-format'             "Clanguage formatter ...working

    "html plugin
    Plugin 'alvan/vim-closetag'         		"close html tags

    "python plugins
    Plugin 'davidhalter/jedi-vim'
    Plugin 'nvie/vim-flake8'                    "f7 to check python files
    "Plugin 'Vimjas/vim-python-pep8-indent'     "python pep8 plugin
    "
    "Git
    Plugin 'tpope/vim-fugitive'


    "Themes
    "Plugin 'dracula/vim'                		"awesome dark theme
    "this worked earlier but nowdays it is creating problems. I will update it as it works. instead of it use flazz/vim-colorschemes
    "we can use it by simply :colorscheme dracula by installing vim-colorschemes
    "I have tested both both will work either use this plugin or copy dracula.vim file into the .vim/colors
    Plugin 'flazz/vim-colorschemes'


    "Some extra
    "Plugin 'terryma/vim-multiple-cursors'      "multiple cursor plugin
    "Plugin 'vim-scripts/ZoomWin'        		"zoom into a window
    "Plugin 'google/vim-codefmt'                "Clanguage not working
    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} "HTML code better

    "working
    "only helps to complete the words in file
    "Plugin 'ervandew/supertab'          		"similar to you completeme


    "https://github.com/vim-scripts/Conque-Shell
    "http://www.drchip.org/astronaut/vim/#SWAPSTRINGS
    "to remove a plugin comment it and run :PluginClean
    "https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL "html
    "autocomplete


call vundle#end()                   		"required
filetype plugin indent on           		"required
"end Vundle code


"COLOR THEMES
    syntax on
    colorscheme dracula                        "you may copy color file and use it or install vim-colorschemes
    "colorscheme space-vim-dark                "dark and soft
    "colorscheme apprentice                    "too soft


"NORMAL CONFIG
    set autoindent
    set smartindent

    set shiftwidth=4
    set expandtab
    set tabstop=4

"set cursor line
    hi CursorLine   cterm=bold ctermbg=darkgrey
    set cursorline!

"relative numbering in lines
    set nu
    set relativenumber


"fold code
    set foldlevel=0
    set foldmethod=syntax
    normal zR

"keep cursor away from top and bottom of screen
"to keep at center set value to 999
    set scrolloff=4

"use mouse in vim
    set mouse=a
    "this also helps in resizing the split window
    "some say to use
    "set mouse=n
    "set ttymouse=xterm2

"searching
    set hlsearch "highlight search
    set incsearch "highlight as we type in search
    nnoremap <CR> :noh<CR><CR>

"set color to 256
    set t_Co=256


"wrapping around lines
    "used to make l key to move to next line after end of line
    "used to make h key to move to upper line after begining of line
    "set whichwrap+=h,l





"HTML TAGS
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
    let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
    let g:closetag_emptyTags_caseSensitive = 1
    let g:closetag_shortcut = '>'
    let g:closetag_close_shortcut = '<leader>>'

"Auto close brackets
    let g:AutoPairsFlyMode = 1
    let g:AutoPairsShortcutBackInsert = '<M-b>'
    set showmatch
    let g:AutoPairsShortcutToggle='<Leader>a' "toggle Auto Pairs
    "let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

"CTAGS
    set autochdir
    set tags=tags; "actually you have to mention location of tags file here



"Nerd tree
    map <F4> :NERDTreeToggle<CR>

"google-plugin
    "augroup autoformat_settings
    "  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    "  autocmd FileType html,css,json AutoFormatBuffer js-beautify
    "  autocmd FileType java AutoFormatBuffer google-java-format
    "  autocmd FileType python AutoFormatBuffer yapf
    "augroup END


"Jedi-vim
    let g:jedi#goto_command = "<leader>goto"
    let g:jedi#goto_assignments_command = "<leader>gd"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "<leader>doc"
    let g:jedi#usages_command = ""
    let g:jedi#completions_command = "<leader><Tab>"
    let g:jedi#rename_command = ""

"Clang-format
    "needs to instll clang-format-5.0
    let g:clang_format#command = "clang-format-5.0"
    let g:clang_format#code_style = "llvm"
    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -4,
                \ "AllowShortIfStatementsOnASingleLine" : "true",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "Standard" : "C++11"}

    "alternative ways to clang-format
    "map <C-K> :pyf /home/srb/.vim/extra/clang-format.py<cr>
    "imap <C-K> <c-o>:pyf /home/srb/.vim/extra/clang-format.py<cr>
    "map <C-k> :pyf /usr/share/clang/clang-format-5.0/clang-format.py<cr>
    "imap <C-k> <c-o>:pyf /usr/share/clang/clang-format-5.0/clang-format.py<cr>


    " map to <Leader>cf in C++ code
    nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    vnoremap <buffer><Leader>cf :ClangFormat<CR>

"you complete me
    let g:ycm_global_ycm_extra_conf = '/home/srb/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"keep script
    :so ~/programs/CheemaFy/srbScripts/vim_scripts/scripts.vim
    :so ~/programs/CheemaFy/srbScripts/vim_scripts/programming.vim


au FileType * :call File_type()

