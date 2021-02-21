-- unload default plugins
require('plugins.unload')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- neovim basic configuration
require('settings')

-- neovim keybindings
require('keybindings')

