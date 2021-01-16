----------------------------------------------------------------------
-- init.lua --- Entry file for neovim
----------------------------------------------------------------------


function filetype(git, ft)
  vim.cmd("Plug '" .. git .. "', {'for': '" .. tostring(ft) .. "' }")
end

function plugin(git)
  vim.cmd("Plug '" .. git .. "'")
end

function pluginWith(git, opt)
  vim.cmd("Plug '" .. git .. "', " .. opt)
end

vim.call 'plug#begin'
-- ft plugins
filetype("LnL7/vim-nix", "nix")
filetype("cespare/vim-toml", "toml")
filetype("elmcast/elm-vim", "elm")
filetype("goolord/haskell-nvim", { "haskell", "cabal" })
filetype("goolord/lbnf.vim", { "bnf", "lbnf" })
filetype("lifepillar/pgsql.vim", "pgsql")
filetype("vmchale/cabal-project-vim", "cabalproject")
filetype("vmchale/dhall-vim", "dhall")
filetype("keith/swift.vim", "swift")
-- misc plugins
plugin("Yggdroot/indentLine")
plugin("dkasak/gruvbox")
plugin("godlygeek/tabular")
plugin("hellerve/carp-vim")
plugin("junegunn/fzf.vim")
plugin("mhinz/vim-startify")
plugin("scrooloose/nerdcommenter")
plugin("tpope/vim-fugitive")
plugin("tpope/vim-rhubarb")
pluginWith("junegunn/fzf", "{ 'do': { -> fzf#install() } }")
pluginWith("ndmitchell/ghcid", "{ 'rtp': 'plugins/nvim' }")
-- deoplete
pluginWith("Shougo/deoplete.nvim", "{ 'do': ':UpdateRemotePlugins' }")
pluginWith("fszymanski/deoplete-emoji", "{ 'for': ['markdown', 'text', 'gitcommit'] }")
plugin("Shougo/neco-syntax")
-- defx
pluginWith("Shougo/defx.nvim", "{ 'do': ':UpdateRemotePlugins' }")
plugin("kristijanhusak/defx-icons")
-- lsp
lspOpts = [[{
  'branch': 'next',
  'do': 'bash install.sh',
  'for': ['haskell', 'rust']
}]]
pluginWith("autozimu/LanguageClient-neovim", string.gsub(lspOpts, "\n", ""))
vim.call 'plug#end'

-- general opts
vim.cmd 'colorscheme gruvbox'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.directory= '$HOME/.swap//'
vim.o.undofile = true          -- Save undos after file closes
vim.o.undodir = '$HOME/.swap/' -- where to save undo histories
vim.o.undolevels = 1000        -- How many undos
vim.o.undoreload = 10000       -- number of lines to save for undo

header = { [[                                 __                 ]]
         , [[    ___     ___    ___   __  __ /\_\    ___ ___     ]]
         , [[   / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\   ]]
         , [[  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \  ]]
         , [[  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\ ]]
         , [[   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/ ]]
         }

vim.g.startify_custom_header = header
vim.g.startify_change_to_idr = 0

vim.g.NERDSpaceDelims            = 1
vim.g.gruvbox_improved_warnings  = 1
vim.g.gruvbox_termcolors         = 256

vim.g.indentLine_fileTypeExclude = { 'json', 'startify', 'help', 'defx', 'ghcid' }
vim.g.indentLine_setColors    = 1
vim.g.indentLine_enabled      = 1
vim.g.indentLine_char         = '▏'
vim.g.indentLine_conceallevel = 1
vim.g.indentLine_color_gui    = '#626262'

-- haskell-vim
vim.g.haskell_enable_quantification   = 1 -- to enable highlighting of `forall`
vim.g.haskell_enable_recursivedo      = 1 -- to enable highlighting of `mdo` and `rec`
vim.g.haskell_enable_arrowsyntax      = 1 -- to enable highlighting of `proc`
vim.g.haskell_enable_pattern_synonyms = 1 -- to enable highlighting of `pattern`
vim.g.haskell_enable_typeroles        = 1 -- to enable highlighting of type roles
vim.g.haskell_enable_static_pointers  = 1 -- to enable highlighting of `static`
vim.g.haskell_indent_disable          = 1

-- gui

vim.api.nvim_command('filetype plugin on')
vim.bo.expandtab   = true
vim.g.guicursor    = 'a:blinkon0'
vim.o.mouse        = 'a'
vim.w.nofoldenable = true
vim.wo.number      = true
vim.bo.shiftwidth  = 2
vim.o.smarttab     = true
vim.b.softtabstop  = 0
vim.b.tabstop      = 2
vim.w.wrap         = true
vim.g.scrolloff    = 5
vim.o.hidden       = true

vim.api.nvim_command([[
hi User1 guibg=#3c3836 guifg=#a89984
set statusline=
set statusline+=%0*\ %{FugitiveHead()}\ 
set statusline+=%1*\ %f\ %m%=
set statusline+=%0*\ %y\ %{&fileencoding?&fileencoding:&encoding}\ [%{&fileformat}\]\ %p%%\ %l:%c\ 
]])

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function tabularize(c) map('', '<Leader>a' .. string.sub(c, 1, 1), ':Tabularize /' .. c .. '<CR>') end

keys = { '(', ')', [[:\+]], [[<\S*>]], ',', '=' }
for _, key in ipairs(keys) do tabularize(key) end
map('', '<Leader>a', ':Tabularize /')
map('', '<Leader>a>', [[:Tabularize /\S*>]])

