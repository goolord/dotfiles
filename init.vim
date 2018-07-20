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
let g:NERDAltDelims_haskell = 1

set expandtab softtabstop=0 shiftwidth=2 smarttab
set guicursor=a:blinkon0
set nofoldenable
set wrap

"Keybinds
nnoremap <A-m> @q 

