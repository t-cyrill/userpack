" twig用設定 (2011/10/20 12:33 cyrill)
autocmd BufNewFile,BufRead *.html set syntax=htmldjango
autocmd BufNewFile,BufRead *.twig set syntax=htmldjango

autocmd FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.cgi  set ft=perl
autocmd BufNewFile,BufRead *.psgi set ft=perl

" phpチェック
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

