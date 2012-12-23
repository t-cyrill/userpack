" neocomplcache
Bundle 'Shougo/neocomplcache'

set completeopt=menuone

let g:neocomplcache_temporary_dir = vim_root.'/cache/neocon'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 5
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_select = 1

let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1,
  \ }

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']

if !exists('g:neocomplcache_next_keyword_patterns')
    let g:neocomplcache_next_keyword_patterns = {}
endif

if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif

let g:NeoComplCache_DictionaryFileTypeLists = {
  \ 'default' : vim_root.'/dic/php.dict',
  \ 'php' : vim_root.'/dic/php.dict',
  \ }
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : vim_root.'/dic/php.dict',
  \ 'php' : vim_root.'/dic/php.dict',
  \ }

execute "autocmd FileType php :set dictionary=".vim_root."/dic/php.dict<CR>"
augroup SetTagsFile
    autocmd!
augroup END

augroup SetOmniCompletionSetting
    autocmd!
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'

if !exists('g:neocomplcache_member_prefix_patterns')
    let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'

inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

