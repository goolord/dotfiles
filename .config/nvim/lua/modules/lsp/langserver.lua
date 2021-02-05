local lspconfig = require('lspconfig')

-- should figure out how to only remap these keybindings
-- in buffers where lsp is on
local function custom_on_attach()
    require('modules.lsp.keybindings')
end

local defaultOpts = { on_attach = custom_on_attach }

-- a bit of a hack :/
local cwd = vim.fn.getcwd()
local blacklist = { "/home/zach/Dev/smurf" }

local function in_blacklist(dir)
    local res = false
    for i,entr in ipairs(blacklist) do
        if string.find(dir, entr) then
            res = true
            break
        else
        end
    end
    return res
end

if in_blacklist(vim.fn.getcwd()) then
else
    lspconfig.hls.setup(defaultOpts)
end

lspconfig.rls.setup(defaultOpts)
-- lspconfig.elmls.setup{}
