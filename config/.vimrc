set nocompatible

syntax on
filetype plugin on
filetype indent on

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

inoremap <C-t> <C-v><Tab>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"nnoremap <C-l> <ESC>:ls<CR>
nnoremap <C-p> <ESC>:bp<CR>
nnoremap <C-n> <ESC>:bn<CR>

nnoremap <C-o> :<C-u>call append(expand('.'), '')<Cr>j

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap ,.  :<C-u>edit $MYVIMRC<Enter>
nnoremap ,s. :<C-u>source $MYVIMRC<Enter>

nnoremap gc `[V`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.cgi  set ft=perl
au BufNewFile,BufRead *.psgi set ft=perl

function! GetStatusEx()
    let str = &fileformat
    if has("multi_byte") && &fileencoding != ""
        let str = &fileencoding . ":" . str
    endif
    let str = "[" . str . "]"
    return str
endfunction

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" twig用設定 (2011/10/20 12:33 cyrill)
autocmd BufNewFile,BufRead *.html set syntax=htmldjango
autocmd BufNewFile,BufRead *.twig set syntax=htmldjango

" phpチェック
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l

" カーソル位置を復元
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" yank行を200まで増やす
set viminfo='20,\"200,:20,%,n~/.viminfo

" ESC ESCで検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ショートカットなキーバインド
nmap <Space>b :ls<CR>:buffer
nmap <Space>f :edit .<CR>
nmap <Space>v :vs<CR>:Explore<CR>
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>s :VimShellInteractive bash<CR>
nmap <Space>eu :Vexplore! ~/pixiv-util/src<CR><C-W>=<CR>
nmap <Space>es :Vexplore! ~/service.pixiv.net/tests/<CR><C-W>=<CR>

if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
    augroup vimrc-undofile
        autocmd!
        autocmd BufReadPre ~/* setlocal undofile
    augroup END
endif

""" Vundle '''
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"filetype plugin on

"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimshell'

Bundle 'Shougo/neocomplcache'
Bundle 'opsplorer'

" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_manual_completion_start_length = 4

"シンタックス補完を無効に
let g:neocomplcache_plugin_disable = {
 \ 'syntax_complete' : 1,
 \ }

"改行で補完ウィンドウを閉じる
"inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
""tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"C-h, BSで補完ウィンドウを確実に閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
   let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

