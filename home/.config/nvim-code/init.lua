vim.opt.rtp:append(os.getenv('HOME') .. '/.config/nvim-code')
vim.opt.rtp:append(os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/tabular/')

require('plugins.unload')
require('settings')
require('keybindings')
