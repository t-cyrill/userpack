""" Vundle '''
execute "set rtp+=".vim_root."/bundle/vundle/"
call vundle#rc(vim_root.'/bundle/')

Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimshell'
Bundle 'opsplorer'
Bundle 't-cyrill/QuickBuf'
"Bundle 'scrooloose/nerdtree'
Bundle 'StanAngeloff/php.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'yanktmp.vim'
"Bundle 'endwise.vim'
Bundle 'rails.vim'
Bundle 'slim-template/vim-slim.git'

if filereadable(expand(vim_root.'/plugins/neocomplcache.vim'))
    execute "source ".vim_root."/plugins/neocomplcache.vim"
endif

if filereadable(expand(vim_root.'/plugins/ctrlp.vim'))
    execute "source ".vim_root."/plugins/ctrlp.vim"
endif

