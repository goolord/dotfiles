"======================================================================
" init.vim --- Entry file for neovim
"======================================================================

" plugins =============================================================
call plug#begin()

" filetype plugins
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': ['haskell', 'cabal'] }
Plug 'goolord/lbnf.vim', { 'for': ['bnf', 'lbnf'] }
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
Plug 'vmchale/cabal-project-vim', { 'for': 'cabalproject' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'hellerve/carp-vim'
" defx
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
" other plugins
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ 'for': ['haskell', 'rust']
\ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'roxma/nvim-yarp'
Plug 'Yggdroot/indentLine'
Plug 'gruvbox-community/gruvbox'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()
"======================================================================

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

let g:indentLine_fileTypeExclude = ['json', 'text', 'markdown', 'startify', 'defx', 'ghcid', 'gitcommit', 'help']
let g:indentLine_setColors       = 1
let g:indentLine_enabled         = 1
let g:indentLine_char            = '▏'
let g:indentLine_conceallevel    = 1
let g:indentLine_color_gui       = '#626262'

" haskell
let hs_highlight_debug = 1

" Gui =================================================================
filetype plugin on
set expandtab
set mouse=a
set nofoldenable
set number
set shiftwidth=2 
set smarttab
set softtabstop=0 
set tabstop=2
set wrap
set scrolloff=5

colorscheme gruvbox
set background=dark         " Setting dark mode
set termguicolors
"======================================================================

" Status line =========================================================
hi User1 guibg=#3c3836 guifg=#a89984

set statusline=
set statusline+=%0*\ %{FugitiveHead()}\ 
set statusline+=%1*\ %f\ %m%=
set statusline+=%0*\ %y\ %{&fileencoding?&fileencoding:&encoding}\ [%{&fileformat}\]\ %p%%\ %l:%c\ 
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

" deoplete ============================================================
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 50000000
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ deoplete#complete()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
call deoplete#custom#option({
  \ 'auto_complete_popup': 'manual',
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

augroup LanguageClient
  au!
  autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:LanguageClient_autoStart = 0
  autocmd! User LanguageClientStarted nmap <expr> <silent> <C-]> has_key(g:LanguageClient_serverCommands, &ft) ? '<Plug>(lcn-definition)' : 'g<C-]>'
augroup END

nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
nmap <silent> <C-e> <Plug>(lcn-explain-error)
map <silent> <Leader>lk <Plug>(lcn-hover)
map <silent> <Leader>lg <Plug>(lcn-definition)
map <silent> <Leader>lr <Plug>(lcn-rename)
map <silent> <Leader>lf <Plug>(lcn-formatting)
map <silent> <Leader>lb <Plug>(lcn-references)
map <silent> <Leader>la <Plug>(lcn-code-action)
map <silent> <Leader>ls <Plug>(lcn-symbols)
"======================================================================

" Performance =========================================================
set nocursorcolumn
set nocursorline
set lazyredraw
syntax sync minlines=256
"======================================================================

" Defx ================================================================
command! -nargs=* DefxZ Defx <args>
  \ -split=vertical -winwidth=30
  \ -show-ignored-files 
  \ -vertical-preview -preview-width=50 
  \ -columns=space:indent:icons:filename:type

command DefxZToggle DefxZ -toggle

map <silent> <Leader>d :DefxZToggle<CR>
"======================================================================

" Keybinds ============================================================
noremap <A-m> @q 
map <space> \
nmap <silent> <esc> :noh<CR>
map <silent> <tab> <C-W>w
" escape a string
map <A-e> :s/\%V"/\\"/g<CR>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
"present tag list
nnoremap <C-]> g<C-]>
"toggle relative numbers
map <silent> <Leader>r :set relativenumber!<CR>
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
  \ }

map <Leader>f%b :BTags<CR>
map <Leader>f%c :BCommits<CR>
map <Leader>f%l :BLines<CR>
map <Leader>f/ :History/<CR>
map <Leader>f: :History:<CR>
map <Leader>fb :Buffers<CR>
map <Leader>fc :Commands<CR>
map <Leader>fg :Commits<CR>
map <Leader>ff :Files<CR>
map <Leader>fh :History<CR>
map <Leader>fl :Lines<CR>
map <Leader>fm :Maps<CR>
map <Leader>fr :Rg 
map <Leader>ft :Tags<CR>
"======================================================================

autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:ghcid_command = "./tools/ghcid.sh --no-height-limit --reverse-errors --clear"

