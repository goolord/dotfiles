local keymap = vim.api.nvim_set_keymap

local function set_keybindings()
    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

        -- disable keys
        {'n', 'Q', '<Nop>', {noremap = true, silent = true}},
        {'n', '<C-z>', '<Nop>', {noremap = true, silent = true}},
        {'', '<MiddleMouse>', '<Nop>', {silent = true} },
        {'i', '<MiddleMouse>', '<Nop>', {silent = true} },

        -- resize window
        {'n', '<C-Left>', '<CMD>vertical resize +5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Up>', '<CMD>resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Right>', '<CMD>vertical resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Down>', '<CMD>resize +5<CR>', {noremap = true, silent = true}},

        -- terminal mode
        {'t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true}},

        -- nvim tree.lua
        {'n', '<Leader>d', '<CMD>NvimTreeToggle<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fd', '<CMD>NvimTreeFindFile<CR>', {noremap = true, silent = false}},

        -- telescope
        {'n', '<Leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fm', '<CMD>lua require("telescope.builtin").marks()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>f_', '<CMD>lua require("telescope.builtin").builtin()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fk', '<CMD>lua require("telescope.builtin").keymaps()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fr', '<CMD>lua require("telescope.builtin").live_grep()<CR>', {noremap = true, silent = false}},

        -- others
        -- Delete in search result
        {'n', '<Leader>x', '<CMD>%s///g<CR>', {noremap = false, silent = false}},

        -- Search for visually selected text
        {'v', '<Leader>v', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', {noremap = false, silent = false}},
        
        {'', '<space>', '\\', {silent = true} },
        {'', '<tab>', '<C-W>w', {noremap = false, silent = true} },
        {'n', '<esc>', ':noh<CR>', {noremap = false, silent = true} },
        {'n', '<Leader>a', '<Plug>(EasyAlign)', {} },
        {'x', '<Leader>a', '<Plug>(EasyAlign)', {} },
        -- tag list
        {'n', '<C-]', 'g<C-]', {noremap = true} },
    }
    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end
set_keybindings()

