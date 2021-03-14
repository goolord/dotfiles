local keymap = vim.api.nvim_set_keymap

local clap_settings = { noremap = true, silent = false }
local function clap_bind(c,provider)
    return {'n', '<Leader>f' .. c, '<CMD>Clap ' .. provider .. '<CR>', clap_settings}
end

local function tabularize_bind(c,regex)
    return {'', '<Leader>a' .. c, ':Tabularize ' .. regex, {} }
end

local function set_keybindings(keybindings)
    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end

set_keybindings {
    -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}
    -- disable keys
    {'', '<MiddleMouse>', '<Nop>', {silent = true} },
    {'i', '<MiddleMouse>', '<Nop>', {silent = true} },
    -- terminal mode
    {'t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true}},
    -- nvim-tree.lua
    {'n', '<Leader>d', '<CMD>NvimTreeToggle<CR>', {noremap = true, silent = false}},
    {'n', '<Leader>fd', '<CMD>NvimTreeFindFile<CR>', {noremap = true, silent = false}},
    -- Clap
    clap_bind('i','filer'),
    clap_bind('f','files'),     -- :find
    clap_bind('q','quickfix'),  -- :copen
    clap_bind('l','loclist'),   -- :lopen
    clap_bind('t','proj_tags'), -- :tj
    clap_bind('b','buffers'),   -- :ls :b
    clap_bind('r','grep'),      -- :grep
    clap_bind('g','grep2'),
    clap_bind('m','maps'),
    clap_bind('M','marks'),
    clap_bind('j','jumps'),
    clap_bind('y','yanks'),
    clap_bind(':','hist:'),
    clap_bind('/','hist/'),
    clap_bind('h','history'),
    clap_bind('_','providers'),
    -- Delete in search result
    {'n', '<Leader>x', '<CMD>%s///g<CR>', {noremap = false, silent = false}},
    -- other
    {'', '<Space>', '<Leader>', {silent = true} },
    {'', '<tab>', '<C-W>w', {noremap = false, silent = true} },
    {'n', '<esc>', ':noh<CR>', {noremap = false, silent = true} },
    {'n', '<Leader>s', ':Startify<CR>', {silent = true} },
    -- tabular
    tabularize_bind('','/'),
    tabularize_bind('(','/(<CR>'),
    tabularize_bind(')','/)<CR>'),
    tabularize_bind(':','/:\\+<CR>'),
    tabularize_bind('<','/<\\S*><CR>'),
    tabularize_bind('=','/=\\S*<CR>'),
    tabularize_bind('>','/\\S*><CR>'),
    tabularize_bind(',','/,/l0r1<CR>'),
    -- tag list
    {'n', '<C-]>', 'g<C-]>', {noremap = true} },
    -- macro
    {'n', '<A-m>', '@q', {} },
}

return set_keybindings
