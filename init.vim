"=====================================================================
" init.vim --- Entry file for neovim
"=====================================================================

execute pathogen#infect()

colorscheme gruvbox
set background=dark " Setting dark mode
set termguicolors

set directory=$HOME/.swap/
set undofile                " Save undos after file closes
set undodir=$HOME/.swap/    " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

let g:startify_custom_header = [
        \ '                                  __                ',
        \ '     ___      __    ___   __  __ /\_\    ___ ___    ',
        \ '    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
        \ '   /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
        \ '   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
        \ '    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
        \ ]

autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit
        \ |   wincmd w
        \ | endif

let g:NERDAltDelims_haskell        = 1
let g:NERDSpaceDelims              = 1
let g:clamp_autostart              = 0
let g:deoplete#enable_at_startup   = 1
let g:gruvbox_improved_warnings    = 1
let g:gruvbox_termcolors           = 256
let g:haskell_tabular              = 0
let g:haskell_conceal_enumerations = 0

let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:indentLine_setColors    = 1
let g:indentLine_enabled      = 1
let g:indentLine_char         = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_color_gui    = '#626262'
autocmd FileType vimfiler :IndentLinesDisable
autocmd FileType startify :IndentLinesDisable

" vimfiler ===========================================================
let g:vimfiler_as_default_explorer        = 1
let g:vimfiler_safe_mode_by_default       = 0
let g:vimfiler_tree_leaf_icon             = " "
let g:vimfiler_tree_opened_icon           = '▼'
let g:vimfiler_tree_closed_icon           = '▷'
let g:vimfiler_file_icon                  = '-'
let g:vimfiler_marked_file_icon           = '✓'
let g:vimfiler_readonly_file_icon         = ''
let g:vimfiler_time_format                = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern             = '\.git\|\.DS_Store\|\.pyc'

nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit <CR>
nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find <CR>
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
" autocmd FileType startify :VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit

"=====================================================================

set expandtab
set guicursor=a:blinkon0
set mouse=a
set nofoldenable
set number
set shiftwidth=2 
set tabstop=2
set smarttab
set softtabstop=0 
set wrap

"Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

"Keybinds
noremap <A-m> @q 
map <space> \
nmap <esc> :noh<CR>
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nmap <A-Del> dw
map <A-1> :b1<CR>
map <A-2> :b2<CR>
map <A-3> :b3<CR>
map <A-4> :b4<CR>
map <A-5> :b5<CR>
map <A-6> :b6<CR>
map <A-7> :b7<CR>
map <A-8> :b8<CR>
map <A-9> :b9<CR>

