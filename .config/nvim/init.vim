"=====================================================================
" init.vim --- Entry file for neovim
"=====================================================================
execute pathogen#infect()
colorscheme gruvbox
set background=dark " Setting dark mode
set termguicolors
set directory=$HOME/.swap//
set undofile                " Save undos after file closes
set undodir=$HOME/.swap/    " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set helpheight=99999

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
        \ |   VimFilerExplorer -split -simple -parent -winwidth=30 -toggle -no-quit
        \ |   wincmd w
        \ | endif

let g:NERDAltDelims_haskell               = 1
let g:NERDSpaceDelims                     = 1
let g:clamp_autostart                     = 0
let g:deoplete#enable_at_startup          = 1
let g:gruvbox_improved_warnings           = 1
let g:gruvbox_termcolors                  = 256
" let g:neosnippet#snippets_directory       = '~/.config/nvim/bundle/vim-snippets/snippets/'
let g:lightline                           = {
      \ 'colorscheme': 'gruvbox',
      \ }

set hidden
set noshowmode
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
nmap <A-1> <Plug>BufTabLine.Go(1)
nmap <A-2> <Plug>BufTabLine.Go(2)
nmap <A-3> <Plug>BufTabLine.Go(3)
nmap <A-4> <Plug>BufTabLine.Go(4)
nmap <A-5> <Plug>BufTabLine.Go(5)
nmap <A-6> <Plug>BufTabLine.Go(6)
nmap <A-7> <Plug>BufTabLine.Go(7)
nmap <A-8> <Plug>BufTabLine.Go(8)
nmap <A-9> <Plug>BufTabLine.Go(9)
nmap <A-0> <Plug>BufTabLine.Go(10)

let g:indentLine_setColors    = 1
let g:indentLine_enabled      = 1
let g:indentLine_char         = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_color_gui    = '#626262'

autocmd FileType vimfiler :IndentLinesDisable
autocmd FileType startify :IndentLinesDisable
autocmd FileType help :IndentLinesDisable
autocmd FileType startify :setlocal nowrap

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

nnoremap <silent> <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit <CR>
nnoremap <silent> <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find <CR>
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
" autocmd FileType startify :VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit

"=====================================================================

set guicursor=a:blinkon0
set mouse=a
set nofoldenable
set number
set softtabstop=0 
set shiftwidth=2 
set expandtab
filetype plugin indent on
set tabstop=2
set smarttab
set wrap

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /::<CR>
vmap <Leader>a: :Tabularize /::<CR>
nmap <Leader>a( :Tabularize /(<CR>
vmap <Leader>a( :Tabularize /(<CR>
nmap <Leader>a) :Tabularize /)<CR>
vmap <Leader>a) :Tabularize /)<CR>
nmap <Leader>a< :Tabularize /<\S*><CR>
vmap <Leader>a< :Tabularize /<\S*><CR>
" nmap <Leader>a<key> :Tabularize /<key><CR>

" Performance
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
let g:haskell_conceal       = 0
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:haskell_hsp           = 0
let g:haskell_tabular       = 0
set lazyredraw


" Keybinds
noremap <A-m> @q 
map <space> \
nmap <silent> <esc> :noh<CR>
nmap <silent> <A-Del> dw
nmap <silent> <tab> <C-W>W
nmap <A-e> :s/\%V"/\\"/g<CR>
vmap <A-e> :s/\%V"/\\"/g<CR>
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Neosnippets keybinds
" imap <A-TAB>         <Plug>(neosnippet_expand_or_jump)
" smap <A-TAB>         <Plug>(neosnippet_expand_or_jump) 
" imap <expr><TAB>     pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB>     neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
