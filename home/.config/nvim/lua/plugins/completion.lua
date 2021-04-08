return function()
    require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        incomplete_delay = 400;
        documentation = true;

        source = {
            nvim_lsp = { priority = 99999 };
            tabnine = true;
            -- buffer = true;
            -- tags = true;
            path = true;
            nvim_lua = true;
            calc = true;
            emoji = { filetypes = {'gitcommit', 'text', 'markdown'} };
            collaborators = { filetypes = {'gitcommit'} }
        };
    }

    local function keymap(k,m) vim.api.nvim_set_keymap('i', k, m, {noremap=true, silent=true, expr=true}) end

    function Check_backspace()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') 
        then return true 
        else return false
        end
    end

    keymap('<C-Space>', 'compe#complete()')
    keymap('<CR>'     , 'compe#confirm("<CR>")')
    keymap('<C-e>'    , 'compe#close("<C-e>")')
    keymap('<Tab>'    , 'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete()')
    keymap('<S-Tab>'  , 'pumvisible() ? "<C-p>" : v:lua.Check_backspace() ? "<S-Tab>" : compe#complete()')

end
