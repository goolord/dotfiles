vim.opt.rtp:remove('/home/zach/.config/nvim/after')
vim.opt.rtp:remove('/home/zach/.config/nvim')
vim.opt.rtp:remove('/home/zach/.local/share/nvim/site/after')
vim.opt.rtp:remove('/home/zach/.local/share/nvim/site/pack/*/start/*')
vim.opt.rtp:remove('/home/zach/.local/share/nvim/site/pack/*/start/*/after')
vim.opt.rtp:remove('/home/zach/.local/share/nvim/site')

vim.opt.rtp:append('/home/zach/.config/nvim-code')

require('plugins.unload')
require('settings')

