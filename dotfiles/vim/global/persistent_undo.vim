if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
    augroup vimrc-undofile
        autocmd!
        autocmd BufReadPre ~/* setlocal undofile
    augroup END
endif


