-- unload default plugins
require('plugins.unload')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- neovim basic configuration
require('settings')

-- gruvbox options
require('plugins.gruvbox')

-- startify
require('plugins.startify')

-- neovim plugins for user interface
require('plugins.indentLine')
require('plugins.nvimTree')
require('plugins.clap')

-- neovim git{_,hub} support
require('plugins.gist')

-- neovim code completion and code formater
require('modules.lsp')
require('plugins.completion')

-- colorscheme
require('modules.colors.gruvbox')
require('plugins.gruvbox')

-- neovim keybindings
require('keybindings')

