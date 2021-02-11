local keymap = vim.api.nvim_set_keymap
local completion = require'completion'

vim.g.completion_enable_auto_popup = 0

keymap('i', '<Tab>', '<Plug>(completion_smart_tab)', {})
keymap('i', '<c-j>', '<Plug>(completion_next_source)', {})
keymap('i', '<c-k>', '<Plug>(completion_prev_source)', {})

vim.g.completion_auto_change_source = 1
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy', 'all' }

vim.g.completion_chain_complete_list = { 
    default = {
        { complete_items = { 'lsp', 'snippet' } },
        { mode = '<c-n>' },
        { mode = 'tags' },
        { complete_items = { 'path' } },
    },
    gitcommit = {
        { mode = 'user' },
        { mode = '<c-n>' },
        { complete_items = { 'path' } },
    }
}
