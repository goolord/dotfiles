local keymap = vim.keymap.set

keymap('', '<Space>', '<Leader>', {silent = true, remap = true} )
-- disable keys
keymap('' , '<MiddleMouse>', '<Nop>', {silent = true, nowait = true, remap = true } )
keymap('i', '<MiddleMouse>', '<Nop>', {silent = true, nowait = true, remap = true} )
keymap('n', '<Leader>ff', "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", {silent = true, nowait = true, remap = true})
