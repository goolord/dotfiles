"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'

let g:haskell_tabular = 0 
let g:indentLine_enabled = 0
let g:clamp_autostart = 0

set expandtab
set guicursor=a:blinkon0
set nofoldenable
set wrap

autocmd VimLeave * set guicursor=a:i:beam-blinkon0

"Keybinds
nnoremap <A-m> @q 


