call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neocomplcache'
"Plug 'Shougo/vimshell'
Plug 'vim-scripts/opsplorer'
Plug 't-cyrill/QuickBuf'
"Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/yanktmp.vim'
"Plug 'endwise.vim'
"Plug 'rails.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'slim-template/vim-slim.git'
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/neocomplcache'

call plug#end()

if filereadable(expand(vim_root.'/plugins/neocomplcache.vim'))
    let g:neocomplete#force_overwrite_completefunc = 1
    execute "source ".vim_root."/plugins/neocomplcache.vim"
endif

if filereadable(expand(vim_root.'/plugins/ctrlp.vim'))
    execute "source ".vim_root."/plugins/ctrlp.vim"
endif

