vim.opt.rtp:append(os.getenv('HOME') .. '/.config/nvim-code')
vim.opt.rtp:append(os.getenv('HOME') .. '.local/share/nvim/lazy/tabular/')

require('plugins.unload')
require('settings')
require('keybindings')
