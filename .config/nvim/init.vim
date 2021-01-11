"======================================================================
" init.vim --- Entry file for neovim
"======================================================================

" plugins =============================================================
call plug#begin()

" filetype plugins
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'goolord/haskell-nvim', { 'for': ['haskell', 'cabal'] }
Plug 'goolord/lbnf.vim', { 'for': ['bnf', 'lbnf'] }
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
Plug 'vmchale/cabal-project-vim', { 'for': 'cabalproject' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'keith/swift.vim', { 'for': 'swift' }
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fszymanski/deoplete-emoji', { 'for': ['markdown', 'text', 'gitcommit'] }
Plug 'Shougo/neco-syntax'
Plug 'fszymanski/deoplete-emoji', { 'for': ['markdown', 'text', 'gitcommit'] }
" Plug 'deoplete-plugins/deoplete-tags'
" Plug 'sebastianmarkow/deoplete-rust'
" defx
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
" other plugins
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ 'for': ['haskell', 'rust', 'cabal', 'stack']
\ }
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'dkasak/gruvbox'
Plug 'godlygeek/tabular'
Plug 'hellerve/carp-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
call plug#end()
"======================================================================

colorscheme gruvbox
set background=dark         " Setting dark mode
set termguicolors

set directory=$HOME/.swap//
set undofile                " Save undos after file closes
set undodir=$HOME/.swap/    " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
" set clipboard=unnamedplus   " vim yanks to clipboard by default

" set helpheight=99999

let g:startify_custom_header = [
        \ '                                  __                ',
        \ '     ___     ___    ___   __  __ /\_\    ___ ___    ',
        \ '    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
        \ '   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
        \ '   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
        \ '    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
        \ ]
nmap <silent> <Leader>s :Startify<CR>
let g:startify_change_to_dir = 0

let g:NERDSpaceDelims            = 1
let g:gruvbox_improved_warnings  = 1
let g:gruvbox_termcolors         = 256
let g:indentLine_fileTypeExclude = ['json']

let g:indentLine_setColors    = 1
let g:indentLine_enabled      = 1
let g:indentLine_char         = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_color_gui    = '#626262'

" haskell-vim
let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
let g:haskell_indent_disable          = 1

autocmd FileType startify :IndentLinesDisable | setlocal nowrap
autocmd FileType help :IndentLinesDisable

" Gui =================================================================
filetype plugin on
set expandtab
set guicursor=a:blinkon0
set mouse=a
set nofoldenable
set number relativenumber
set shiftwidth=2 
set smarttab
set softtabstop=0 
set tabstop=2
set wrap
set scrolloff=5
set list listchars=trail:·
"======================================================================

" Status line =========================================================
hi User1 guibg=#3c3836 guifg=#a89984

set statusline=
set statusline+=%0*\ %{FugitiveHead()}\ 
set statusline+=%1*\ %f\ %m%=
set statusline+=%0*\ %y\ %{&fileencoding?&fileencoding:&encoding}\ [%{&fileformat}\]\ %p%%\ %l:%c
set statusline+=\ 
"======================================================================

" Tabular =============================================================
map <Leader>a :Tabularize /
map <Leader>a( :Tabularize /(<CR>
map <Leader>a) :Tabularize /)<CR>
map <Leader>a: :Tabularize /:\+<CR>
map <Leader>a< :Tabularize /<\S*><CR>
map <Leader>a, :Tabularize /,<CR>
map <Leader>a= :Tabularize /=<CR>
map <Leader>a> :Tabularize /\S*><CR>
"======================================================================

" Deoplete ======================================================
autocmd FileType gitcommit,text,markdown call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 50000000
let g:necosyntax#min_keyword_length = 2
let g:necosyntax#max_syntax_lines = 50000000
" tab-complete 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
call deoplete#custom#option({
  \ 'auto_complete_delay': 300,
  \ 'smart_case': v:false,
  \ 'camel_case': v:false,
  \ 'sources': {
    \ '_': ['buffer', 'tag', 'omni', 'emoji'],
    \ 'haskell': ['buffer', 'tag', 'omni', 'LanguageClient', 'syntax'],
    \ 'rust': ['buffer', 'tag', 'omni', 'LanguageClient', 'syntax'],
    \ },
  \ })
call deoplete#custom#source('omni', 'functions', {
  \ 'haskell': ['haskellcomplete#Complete']
  \})
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'haskell': ['import\s*\(qualified\)\?\s*\(\w\|\.\)*', '{-#\s*\w* .*'],
  \})
"======================================================================

" LanguageClient ======================================================
set hidden
let g:LanguageClient_rootMarkers = {
  \ 'haskell': ['*.cabal', 'stack.yaml'],
  \ 'rust': ['Cargo.toml'], 
  \ }
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ }
let g:LanguageClient_settingsPath = expand('~/.config/nvim/lsp.json')
let g:LanguageClient_useVirtualText = "Diagnostics"

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> <C-e> :call LanguageClient#explainErrorAtPoint()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
    map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
    map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
    map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
    map <Leader>lb :call LanguageClient#textDocument_references()<CR>
    map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
    map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()
"======================================================================

" Performance =========================================================
set nocursorcolumn
set nocursorline
" set norelativenumber
set lazyredraw
syntax sync minlines=256
"======================================================================

" Defx ================================================================
map <silent> <Leader>d :Defx -new -toggle -split=vertical -winwidth=35 -columns=space:indent:icons:filename:type <CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  set norelativenumber
  set nonu
  set cursorline
  execute 'IndentLinesDisable'
  " Define mappings
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l 
    \ defx#is_directory() ?
    \ defx#do_action('open_tree', 'toggle') :
    \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> L defx#do_action('open')
  nnoremap <silent><buffer><expr> P defx#do_action('preview')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <CR> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction
"======================================================================

" Keybinds ============================================================
noremap <A-m> @q 
map <space> \
nmap <silent> <esc> :noh<CR>
map <silent> <A-Del> dw
map <silent> <tab> <C-W>w
map <A-e> :s/\%V"/\\"/g<CR>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
"present tag list
nnoremap <C-]> g<C-]> 
"fzf
map <Leader>f%b :BTags<CR>
map <Leader>f%c :BCommits<CR>
map <Leader>f%l :BLines<CR>
map <Leader>f/ :History/<CR>
map <Leader>f: :History:<CR>
map <Leader>fb :Buffers<CR>
map <Leader>fc :Commands<CR>
map <Leader>fc :Commits<CR>
map <Leader>ff :Files<CR>
map <Leader>fh :History<CR>
map <Leader>fl :Lines<CR>
map <Leader>fm :Maps<CR>
map <Leader>fr :Rg 
map <Leader>ft :Tags<CR>
"toggle relative numbers
map <silent> <Leader>l :set relativenumber!<CR>
"del quotes
nnoremap do" di"vawp
map <silent> <F7> :setlocal spell! spelllang=en_us<CR>
"======================================================================

" Terminal ============================================================
nnoremap <Leader>t :vs<bar>term<cr><c-w>L:vertical resize 60<cr>
autocmd TermOpen * call TermKeyBinds()
au FileType fzf tunmap <Esc>

function TermKeyBinds()
  set norelativenumber
  set nonu
  tnoremap <Esc> <c-\><c-n>
endfunction
"======================================================================

" Ghcid ===============================================================
autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:ghcid_command = "./tools/ghcid.sh"
autocmd FileType ghcid call GhcidWinOpts()
function GhcidWinOpts()
  execute 'windo wincmd L'
  execute 'vertical resize 90 <CR>'
  execute 'IndentLinesDisable'
endfunction
"======================================================================

" fzf =================================================================
let g:fzf_colors = { 
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] 
  \ }
"======================================================================
