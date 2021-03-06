return function()
    vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_hide_dotfiles = 1

    local function tree_cb(cb_name)
      return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
    end

    vim.g.nvim_tree_bindings = {
        { key='l'   , cb=tree_cb("edit") },
        { key='o'   , cb=tree_cb("edit") },
        { key='<cr>', cb=tree_cb("edit") },
        { key='I'   , cb=tree_cb("toggle_ignored") },
        { key='H'   , cb=tree_cb("toggle_dotfiles") },
        { key='R'   , cb=tree_cb("refresh") },
        { key='='   , cb=tree_cb("preview") }
    }

    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
    }

    -- disable word wrap
    vim.cmd('autocmd FileType LuaTree setlocal nowrap')
end
