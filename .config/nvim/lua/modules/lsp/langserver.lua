local lspconfig = require('lspconfig')

local function custom_on_init()
    print('Language Server Protocol started!')
end

lspconfig.hls.setup{}
lspconfig.rls.setup{}
