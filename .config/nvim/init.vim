"======================================================================
" init.vim --- Entry file for neovim
"======================================================================
call plug#begin()
Plug 'w0rp/ale', { 'for': 'rust' }
Plug 'Shougo/deoplete.nvim'
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'scrooloose/nerdcommenter'
Plug 'dkasak/gruvbox'
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'cabal'] }
Plug 'Shougo/unite.vim'
Plug 'goolord/lbnf.vim', { 'for': ['bnf', 'lbnf'] }
Plug 'Yggdroot/indentLine'
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimfiler.vim'
" Plug 'tpope/vim-fugitive'
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml', { 'for': 'toml' }
call plug#end()

colorscheme gruvbox
set background=dark         " Setting dark mode
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
        \ |   VimFilerExplorer -split -simple -parent -winwidth=30 
        \     -toggle -no-quit
        \ |   wincmd w
        \ | endif

let g:NERDSpaceDelims            = 1
let g:clamp_autostart            = 0
let g:deoplete#enable_at_startup = 1
let g:gruvbox_improved_warnings  = 1
let g:gruvbox_termcolors         = 256
let g:indentLine_fileTypeExclude = ['json']

let g:indentLine_setColors    = 1
let g:indentLine_enabled      = 1
let g:indentLine_char         = '⎸'
" let g:indentLine_char         = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_color_gui    = '#626262'
" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_indent_disable = 1

autocmd FileType vimfiler :IndentLinesDisable
autocmd FileType startify :IndentLinesDisable
autocmd FileType help :IndentLinesDisable
autocmd FileType startify :setlocal nowrap

" vimfiler ============================================================
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

nnoremap <silent> <Leader>d :<C-u>
  \ VimFilerExplorer -split -simple
  \ -parent -winwidth=35 -toggle -no-quit <CR>
nnoremap <silent> <Leader>jf :<C-u>
  \ VimFilerExplorer -split -simple
  \ -parent -winwidth=35 -no-quit -find <CR>
autocmd FileType vimfiler
  \ nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler 
  \ nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler 
  \ nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
  \ "\<Plug>(vimfiler_expand_tree)",
  \ "\<Plug>(vimfiler_edit_file)")

"======================================================================

filetype plugin on
set expandtab
set guicursor=a:blinkon0
set mouse=a
set nofoldenable
set number
set shiftwidth=2 
set smarttab
set softtabstop=0 
set tabstop=2
set wrap

" Airline
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9
nmap <silent> <A-0> :blast<CR>
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline_detect_modified=1
let g:airline_skip_empty_sections = 1

" Tabular
nmap <Leader>a= :Tabularize /,<CR>
vmap <Leader>a= :Tabularize /,<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\+<CR>
vmap <Leader>a: :Tabularize /:\+<CR>
nmap <Leader>a( :Tabularize /(<CR>
vmap <Leader>a( :Tabularize /(<CR>
nmap <Leader>a) :Tabularize /)<CR>
vmap <Leader>a) :Tabularize /)<CR>
nmap <Leader>a< :Tabularize /<\S*><CR>
vmap <Leader>a< :Tabularize /<\S*><CR>
" nmap <Leader>a<key> :Tabularize /<key><CR>

" ale
let g:ale_completion_enabled = 1
" let g:ale_rust_carg_use_clippy = 1
let g:airline#extensions#ale#enabled = 1
let b:ale_fixers = 
\   { 'rust': ['rustfmt']
\   , 'haskell': ['hfmt']
\   }
let g:ale_linters = 
\   { 'haskell': ['hdevtools', 'hfmt', 'hlint'],
\   }
let g:ale_enabled = 0
nmap <silent> <Leader>< <Plug>(ale_previous_wrap)
nmap <silent> <Leader>> <Plug>(ale_next_wrap)
nmap <silent> <Leader>? <Plug>(ale_detail)
autocmd FileType rust :ALEEnable
" autocmd FileType haskell :ALEEnable

" ghcid
" let g:ghcid_command = "ghcid -c 'cabal new-repl'"
" set hidden

" Performance
set nocursorcolumn
set nocursorline
set norelativenumber
set lazyredraw
syntax sync minlines=256

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
call deoplete#custom#option({
  \ 'auto_complete_delay': 400,
  \ 'smart_case': v:true,
  \ })

" function! SynStack()
  " if !exists("*synstack")
    " return
  " endif
  " echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

