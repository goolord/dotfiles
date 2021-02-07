local lspconfig = require('lspconfig')

-- should figure out how to only remap these keybindings
-- in buffers where lsp is on
local function custom_on_attach()
    require('modules.lsp.keybindings')
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

-- a bit of a hack :/
local cwd = vim.fn.getcwd()
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

if not in_blacklist(vim.fn.getcwd()) then
    lspconfig.hls.setup(defaultOpts)
end

lspconfig.rls.setup(defaultOpts)
-- lspconfig.elmls.setup{}
