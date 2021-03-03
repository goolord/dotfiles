local keymap = vim.api.nvim_set_keymap

local clap_settings = { noremap = true, silent = false }
local function clap_bind(c,provider)
    return {'n', '<Leader>f' .. c, '<CMD>Clap ' .. provider .. '<CR>', clap_settings}
end

local function tabularize_bind(c,regex)
    return {'', '<Leader>a' .. c, ':Tabularize ' .. regex, {} }
end

local function set_keybindings()
    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}
        -- disable keys
        {'', '<MiddleMouse>', '<Nop>', {silent = true} },
        {'i', '<MiddleMouse>', '<Nop>', {silent = true} },
        -- terminal mode
        {'t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true}},
        -- nvim tree.lua
        {'n', '<Leader>d', '<CMD>NvimTreeToggle<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>fd', '<CMD>NvimTreeFindFile<CR>', {noremap = true, silent = false}},
        -- Clap
        -- :find
        clap_bind('f','files'),
        clap_bind('i','filer'),
        -- :copen
        clap_bind('q','quickfix'),
        -- :lopen
        clap_bind('l','loclist'),
        -- :tj
        clap_bind('t','proj_tags'),
        -- vista uninstalled
        -- clap_bind('T','tags'),
        -- :ls :b
        clap_bind('b','buffers'),
        -- :grep
        clap_bind('r','grep'),
        clap_bind('g','grep2'),
        clap_bind('m','maps'),
        clap_bind('M','marks'),
        clap_bind('j','jumps'),
        clap_bind('y','yanks'),
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
        tabularize_bind('=','/=<CR>'),
        tabularize_bind('>','/\\S*><CR>'),
        tabularize_bind(',','/,/l0r1<CR>'),
        -- tag list
        {'n', '<C-]>', 'g<C-]>', {noremap = true} },
        -- macro
        {'n', '<A-m>', '@q', {} },
    }
    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end

set_keybindings()
