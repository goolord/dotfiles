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

        -- Clap
        {'n', '<Leader>ff', '<CMD>Clap files<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>ft', '<CMD>Clap tags<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fT', '<CMD>Clap proj_tags<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fb', '<CMD>Clap buffers<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fr', '<CMD>Clap grep<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fg', '<CMD>Clap grep2<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fm', '<CMD>Clap maps<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>f_', '<CMD>Clap providers<CR>', {noremap = true, silent = false}},

        -- Delete in search result
        {'n', '<Leader>x', '<CMD>%s///g<CR>', {noremap = false, silent = false}},

        -- Search for visually selected text
        {'v', '<Leader>v', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', {noremap = false, silent = false}},
        
        {'', '<Space>', '<Leader>', {silent = true} },
        {'', '<tab>', '<C-W>w', {noremap = false, silent = true} },
        {'n', '<esc>', ':noh<CR>', {noremap = false, silent = true} },
        {'n', '<Leader>a', '<Plug>(EasyAlign)', {} },
        {'x', '<Leader>a', '<Plug>(EasyAlign)', {} },
        {'n', '<Leader>s', ':Startify<CR>', {silent = true} },
        -- tabular
        {'', '<Leader>a' , ':Tabularize /'          , {} },
        {'', '<Leader>a(', ':Tabularize /(<CR>'     , {} },
        {'', '<Leader>a)', ':Tabularize /)<CR>'     , {} },
        {'', '<Leader>a:', ':Tabularize /:\\+<CR>'  , {} },
        {'', '<Leader>a<', ':Tabularize /<\\S*><CR>', {} },
        {'', '<Leader>a=', ':Tabularize /=<CR>'     , {} },
        {'', '<Leader>a>', ':Tabularize /\\S*><CR>' , {} },
        {'', '<Leader>a,', ':Tabularize /,<CR>'     , {} },
        -- tag list
        {'n', '<C-]>', 'g<C-]>', {noremap = true} },
    }
    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end
set_keybindings()

