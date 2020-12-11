"======================================================================
" init.vim --- Entry file for neovim
"======================================================================

" plugins =============================================================
call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ 'for': ['haskell', 'rust', 'cabal', 'stack']
\ }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/unite.vim'
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dkasak/gruvbox'
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'godlygeek/tabular'
Plug 'goolord/haskell-nvim', { 'for': ['haskell', 'cabal'] }
Plug 'goolord/lbnf.vim', { 'for': ['bnf', 'lbnf'] }
Plug 'hellerve/carp-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-syntax-shakespeare', { 'for': ['hamlet', 'lucius'] }
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vmchale/cabal-project-vim', { 'for': 'cabalproject' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'tpope/vim-fugitive'
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

set helpheight=99999

let g:startify_custom_header = [
        \ '                                  __                ',
        \ '     ___     ___    ___   __  __ /\_\    ___ ___    ',
        \ '    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
        \ '   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
        \ '   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
        \ '    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
        \ ]
nmap <silent> <Leader>s :Startify<CR>

let g:NERDSpaceDelims            = 1
let g:clamp_autostart            = 0
let g:gruvbox_improved_warnings  = 1
let g:gruvbox_termcolors         = 256
let g:indentLine_fileTypeExclude = ['json']

let g:indentLine_setColors    = 1
let g:indentLine_enabled      = 1
let g:indentLine_char         = '▏'
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

autocmd FileType startify :IndentLinesDisable
autocmd FileType help :IndentLinesDisable
autocmd FileType startify :setlocal nowrap

"======================================================================

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

" Airline =============================================================
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

let g:airline_detect_modified=1
let g:airline_skip_empty_sections = 1
" tab config in git history
let g:airline#extensions#tabline#enabled = 0 
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

" LanguageClient ======================================================
set hidden
let g:LanguageClient_rootMarkers = {
  \ 'haskell': ['*.cabal', 'stack.yaml'],
  \ 'rust': ['Cargo.toml'], 
  \ }
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['ghcide', '--lsp'],
    \ }
let g:LanguageClient_useVirtualText = 0

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> <C-e> :call LanguageClient#explainErrorAtPoint()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()
"======================================================================

" Deoplete ======================================================
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 50000000
" tab-complete 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
call deoplete#custom#option({
  \ 'auto_complete_delay': 300,
  \ 'smart_case': v:false,
  \ 'sources': {
    \ '_': ['buffer', 'tag'],
    \ },
  \ })
"======================================================================

" Performance =========================================================
set nocursorcolumn
set nocursorline
" set norelativenumber
set lazyredraw
syntax sync minlines=256
"======================================================================

" Netrw ============================================================
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_banner=0
map <silent> <Leader>d :Lexplore<CR>
autocmd FileType netrw set nolist
autocmd FileType netrw :vertical resize 30 <CR>
autocmd FileType netrw
  \ nmap <buffer> l <CR>
"======================================================================

" Keybinds ============================================================
noremap <A-m> @q 
map <space> \
nmap <silent> <esc> :noh<CR>
map <silent> <A-Del> dw
map <silent> <tab> <C-W>W
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
"======================================================================

" Terminal ============================================================
nnoremap <Leader>t :vs<bar>term<cr><c-w>L:vertical resize 60<cr>
autocmd TermOpen * set norelativenumber
autocmd TermOpen * set nonu
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>
"======================================================================

" Ghcid ============================================================
autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:ghcid_command = "./tools/ghcid.sh"
"======================================================================
