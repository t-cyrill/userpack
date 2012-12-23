set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp,cp932
set fileformats=unix,dos,mac

set ambiwidth=double
set backspace=indent,eol,start
set formatoptions+=m
set list
set listchars=tab:>-,extends:<,trail:-
set number
set hidden

set wildmenu
set showmatch

set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set smartindent
set expandtab
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4

set laststatus=2
set statusline=[%n]\ %t\ %y%{GetStatusEx()}\ %m%h%r=%l/%L,%c%V\ %P

highlight ZenkakuSpace cterm=underline ctermfg=lightblue
match ZenkakuSpace /　/

" status lineで使っている関数
function! GetStatusEx()
    let str = &fileformat
    if has("multi_byte") && &fileencoding != ""
        let str = &fileencoding . ":" . str
    endif
    let str = "[" . str . "]"
    return str
endfunction

