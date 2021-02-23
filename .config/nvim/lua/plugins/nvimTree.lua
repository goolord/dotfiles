return function()
    vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_hide_dotfiles = 1

    local function get_lua_cb(cb_name)
      return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
    end 

    vim.g.nvim_tree_bindings = {
        ['l']    = get_lua_cb("edit"),
        ['o']    = get_lua_cb("edit"),
        ['<cr>'] = get_lua_cb("edit"),
        ['I']    = get_lua_cb("toggle_ignored"),
        ['H']    = get_lua_cb("toggle_dotfiles"),
        ['R']    = get_lua_cb("refresh"),
        ['=']    = get_lua_cb("preview"),
    }

    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        folder = {default = " ", open = " "},
    }

    -- disable word wrap
    vim.cmd('autocmd FileType LuaTree setlocal nowrap')
end
