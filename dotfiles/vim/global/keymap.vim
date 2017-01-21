"inoremap <C-t> <C-v><Tab>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>

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
nnoremap <Space>] :pop<CR>
nmap <Space>n :NERDTree<CR>

