vim.opt.rtp:append(os.getenv('HOME') .. '/.config/nvim-code')

require('plugins.unload')
require('settings')
require('keybindings')
