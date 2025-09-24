local keymap = vim.keymap.set

local vscode = require('vscode')

keymap('', '<Space>', '<Leader>', { silent = true, remap = true })
-- disable keys
keymap('', '<MiddleMouse>', '<Nop>', { silent = true, nowait = true, remap = true })
keymap('i', '<MiddleMouse>', '<Nop>', { silent = true, nowait = true, remap = true })
keymap('', '<Leader>ff', function () vscode.call('workbench.action.quickOpen') end,
    { silent = true, nowait = true, remap = true })
keymap('', '<Leader>fg', function () vscode.call('search.action.openEditor') end,
    { silent = true, nowait = true, remap = true })
keymap('', '<Leader>d', function()
    vscode.call('workbench.action.toggleSidebarVisibility')
end, { silent = true, nowait = true, remap = true })
keymap('', '<Leader>t', function () vscode.call('workbench.action.terminal.toggleTerminal') end,
    { silent = true, nowait = true, remap = true })
keymap('n', '<Esc>', "<Cmd>noh<CR>", { silent = true, nowait = true, remap = false })

local function tabularize(key, regex)
    keymap('', '<Leader>a' .. key, ':Tabularize ' .. regex, { silent = true, nowait = false, remap = false })
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

keymap('', '<C-h>', '<cmd>wincmd h<cr>', 'Window left', { silent = true, nowait = true, remap = true })
keymap('', '<C-j>', '<cmd>wincmd j<cr>', 'Widnow down', { silent = true, nowait = true, remap = true })
keymap('', '<C-k>', '<cmd>wincmd k<cr>', 'Window up', { silent = true, nowait = true, remap = true })
keymap('', '<C-l>', '<cmd>wincmd l<cr>', 'Window right', { silent = true, nowait = true, remap = true })
