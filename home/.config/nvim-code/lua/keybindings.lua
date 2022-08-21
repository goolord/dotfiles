local keymap = vim.keymap.set

keymap('', '<Space>', '<Leader>', {silent = true, remap = true} )
-- disable keys
keymap('' , '<MiddleMouse>', '<Nop>', {silent = true, nowait = true, remap = true } )
keymap('i', '<MiddleMouse>', '<Nop>', {silent = true, nowait = true, remap = true} )
keymap('', '<Leader>ff', "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", {silent = true, nowait = true, remap = true})
keymap('', '<Leader>fg', "<Cmd>call VSCodeNotify('search.action.openEditor')<CR>", {silent = true, nowait = true, remap = true})
keymap('', '<Leader>d', "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {silent = true, nowait = true, remap = true})
keymap('', '<Leader>t', "<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>", {silent = true, nowait = true, remap = true})
keymap('n', '<Esc>', "<Cmd>noh<CR>", {silent = true, nowait = true, remap = false})

local function tabularize(key, regex)
    keymap('', '<Leader>a' .. key, ':Tabularize ' .. regex, {silent = true, nowait = false, remap = false})
end

tabularize('a', '/')
tabularize('(', '/(/r0<CR>')
tabularize(')', '/)/l0<CR>')
tabularize('[', '/[/r0<CR>')
tabularize(']', '/]/l0<CR>')
tabularize('{', '/{<CR>')
tabularize('}', '/}<CR>')
tabularize(':', '/:\\+<CR>')
tabularize('<', '/<\\S*><CR>')
tabularize('>', '/\\S*><CR>')
tabularize('=', '/=\\S*<CR>')
tabularize(',', '/,/l0r1<CR>')
