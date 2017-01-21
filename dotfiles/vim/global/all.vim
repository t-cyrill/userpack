if filereadable(expand(vim_root.'/global/set.vim'))
    execute "source ".vim_root."/global/set.vim"
endif

if filereadable(expand(vim_root.'/global/filetype.vim'))
    execute "source ".vim_root."/global/filetype.vim"
endif

if filereadable(expand(vim_root.'/global/misc.vim'))
    execute "source ".vim_root."/global/misc.vim"
endif

if filereadable(expand(vim_root.'/global/persistent_undo.vim'))
    execute "source ".vim_root."/global/persistent_undo.vim"
endif

if filereadable(expand(vim_root.'/global/store_cursor_position.vim'))
    execute "source ".vim_root."/global/store_cursor_position.vim"
endif

if filereadable(expand(vim_root.'/global/keymap.vim'))
    execute "source ".vim_root."/global/keymap.vim"
endif

