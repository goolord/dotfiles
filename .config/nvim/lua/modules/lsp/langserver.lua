return function()
    local lspconfig = require('lspconfig')

    -- a bit of a hack :/
    local blacklist = { "/home/zach/Dev/smurf" }

    local function in_blacklist(dir)
        local res = false
        for _,entr in pairs(blacklist) do
            if string.find(dir, entr) then
                res = true
                break
            end
        end
        return res
    end

    -- should figure out how to only remap these keybindings
    -- in buffers where lsp is on
    local function custom_on_attach(client)
        if in_blacklist(vim.fn.getcwd()) then
            client.stop()
            return
        end

        local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- keymaps
        buf_keymap('n', 'K'        , ':lua vim.lsp.buf.hover()<CR>'             , {noremap = false, silent = true})
        buf_keymap('n', '<C-]>'    , ':lua vim.lsp.buf.definition()<CR>'        , {noremap = false, silent = true})
        buf_keymap('n', 'gA'       , ':lua vim.lsp.buf.code_action()<CR>'       , {noremap = true , silent = true})
        buf_keymap('n', 'gd'       , ':lua vim.lsp.buf.definition()<CR>'        , {noremap = true , silent = true})
        buf_keymap('n', 'g['       , ':lua vim.lsp.diagnostic.goto_prev()<CR>'  , {noremap = true , silent = true})
        buf_keymap('n', 'g]'       , ':lua vim.lsp.diagnostic.goto_next()<CR>'  , {noremap = true , silent = true})
        buf_keymap('n', 'gl'       , ':lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true , silent = true})
        buf_keymap('n', 'gr'       , ':lua vim.lsp.buf.references()<CR>'        , {noremap = true , silent = true})
        buf_keymap('n', 'gR'       , ':lua vim.lsp.buf.rename()<CR>'            , {noremap = true , silent = true})
        buf_keymap('n', '<leader>F', ':lua vim.lsp.buf.formatting()<CR>'        , {noremap = true , silent = true})
        buf_keymap('v', '<leader>F', ':lua vim.lsp.buf.formatting()<CR>'        , {noremap = true , silent = true})
        -- nvim-lsputils
        vim.lsp.handlers['textDocument/codeAction']     = require'lsputil.codeAction'.code_action_handler
        vim.lsp.handlers['textDocument/references']     = require'lsputil.locations'.references_handler
        vim.lsp.handlers['textDocument/definition']     = require'lsputil.locations'.definition_handler
        vim.lsp.handlers['textDocument/declaration']    = require'lsputil.locations'.declaration_handler
        vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
        vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
        vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
        vim.lsp.handlers['workspace/symbol']            = require'lsputil.symbols'.workspace_handler
    end

    local defaultOpts = { on_attach = custom_on_attach }

    lspconfig.hls.setup(defaultOpts)
    lspconfig.rls.setup(defaultOpts)
    -- lspconfig.elmls.setup{}
end
