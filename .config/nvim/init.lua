vim.g.startify_custom_header = {
        [[                                  __                ]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

-- unload default plugins
require('plugins.unload')

-- neovim basic configuration
require('settings')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- gruvbox options
require('plugins.gruvbox')

-- neovim plugins for user interface
require('plugins.indentLine')
require('plugins.nvimTree')

-- neovim plugins for functionality
require('plugins.telescope')

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

