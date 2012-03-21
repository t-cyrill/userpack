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
"set rtp+=~/.vim/vundle/
"call vundle#rc()
"filetype plugin on

"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimshell'

