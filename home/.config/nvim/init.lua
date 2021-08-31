-- Improve startup time: neovim/neovim/pull/15436
pcall(require, "impatient")

-- unload default plugins
require('plugins.unload')

-- install packer
require('plugins.bootstrapping')

-- neovim package manager
require('plugins')

-- neovim basic configuration
require('settings')

-- neovim keybindings
require('keybindings')
