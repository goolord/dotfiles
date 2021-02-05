-- vim.g.nvim_tree_side = 'left'
-- vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_root_folder_modifier = ':~'

vim.g.nvim_tree_bindings = {
    edit = {'l', 'o', '<cr>'},
    toggle_ignored = 'I',
    toggle_dotfiles = 'H',
    refresh = 'R',
    preview = '=',
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    -- git = {unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★"},
    folder = {default = " ", open = " "},
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
