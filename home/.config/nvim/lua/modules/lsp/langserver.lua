local lspconfig = require('lspconfig')

return function()

    local function custom_on_attach(client)
        local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- keymaps
        buf_keymap('n', 'K'         , ':lua vim.lsp.buf.hover()<CR>'                       , {noremap = false, silent = true})
        buf_keymap('n', '<C-]>'     , ':lua vim.lsp.buf.definition()<CR>'                  , {noremap = false, silent = true})
        buf_keymap('n', 'gA'        , ':lua vim.lsp.buf.code_action()<CR>'                 , {noremap = true , silent = true})
        buf_keymap('n', 'gd'        , ':lua vim.lsp.buf.definition()<CR>'                  , {noremap = true , silent = true})
        buf_keymap('n', 'gD'        , ':lua vim.lsp.buf.type_definition()<CR>'             , {noremap = true , silent = true})
        buf_keymap('n', '<leader>fs', ':lua vim.lsp.buf.workspace_symbol()<CR>'            , {noremap = true , silent = true})
        buf_keymap('n', '<C-e>'     , ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true , silent = true})
        buf_keymap('n', 'g['        , ':lua vim.lsp.diagnostic.goto_prev()<CR>'            , {noremap = true , silent = true})
        buf_keymap('n', 'g]'        , ':lua vim.lsp.diagnostic.goto_next()<CR>'            , {noremap = true , silent = true})
        buf_keymap('n', 'gl'        , ':lua vim.lsp.diagnostic.set_loclist()<CR>'          , {noremap = true , silent = true})
        buf_keymap('n', 'gr'        , ':lua vim.lsp.buf.references()<CR>'                  , {noremap = true , silent = true})
        buf_keymap('n', 'gR'        , ':lua vim.lsp.buf.rename()<CR>'                      , {noremap = true , silent = true})
        buf_keymap('' , '<leader>F' , ':lua vim.lsp.buf.formatting()<CR>'                  , {noremap = true , silent = true})
        -- telescope
        local telescope = require('telescope')
        vim.lsp.handlers["textDocument/references"]     = telescope.builtin.lsp_references
        vim.lsp.handlers['textDocument/codeAction']     = telescope.builtin.code_actions
        vim.lsp.handlers['textDocument/references']     = telescope.builtin.references
        vim.lsp.handlers['textDocument/definition']     = telescope.builtin.definitions
        vim.lsp.handlers['textDocument/documentSymbol'] = telescope.builtin.document_symbols
        vim.lsp.handlers['workspace/symbol']            = telescope.builtin.workspace_symbols

        vim.cmd('setlocal signcolumn=yes')
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      }
    }

    lspconfig.hls.setup {
        on_attach = custom_on_attach,
        capabilities = capabilities,
        settings = {
            haskell = {
                hlintOn = false,
            }
        }
    }
    lspconfig.rust_analyzer.setup {
        on_attach = custom_on_attach,
        capabilities = capabilities
    }
end
