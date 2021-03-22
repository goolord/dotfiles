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
            path          = true;
            buffer        = true;
            calc          = true;
            nvim_lsp      = true;
            nvim_lua      = true;
            tags          = true;
            emoji         = { filetypes = {'gitcommit', 'text', 'markdown'} };
            collaborators = { filetypes = {'gitcommit'} }
        };
    }

    local keymap = vim.api.nvim_set_keymap

    keymap('i', '<C-Space>', 'compe#complete()'             , {noremap=true,silent=true,expr=true})
    keymap('i', '<CR>'     , 'compe#confirm("<CR>")'        , {noremap=true,silent=true,expr=true})
    keymap('i', '<C-e>'    , 'compe#close("<C-e>")'         , {noremap=true,silent=true,expr=true})

    function Check_backspace()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    keymap('i', '<Tab>',
        'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete()',
        {silent = true, noremap = true, expr = true})
end


