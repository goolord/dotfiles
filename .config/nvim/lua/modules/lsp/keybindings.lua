local keymap = vim.api.nvim_set_keymap

function Show_documentation()
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.cmd('lua vim.lsp.buf.hover()')
    end
end

keymap('n' , 'K'         , ':lua Show_documentation()<CR>'             , {noremap = true , silent = true})
keymap('n' , 'gA'        , ':lua vim.lsp.buf.code_action()<CR>'        , {noremap = true , silent = true})
keymap('n' , 'gd'        , ':lua vim.lsp.buf.definition()<CR>'         , {noremap = true , silent = true})
keymap('n' , 'g['        , ':lua vim.lsp.diagnostic.goto_prev()<CR>'   , {noremap = true , silent = true})
keymap('n' , 'g]'        , ':lua vim.lsp.diagnostic.goto_next()<CR>'   , {noremap = true , silent = true})
keymap('n' , 'gl'        , ':lua vim.lsp.diagnostic.set_loclist()<CR>' , {noremap = true , silent = true})
keymap('n' , 'gr'        , ':lua vim.lsp.buf.references()<CR>'         , {noremap = true , silent = true})
keymap('n' , 'gR'        , ':lua vim.lsp.buf.rename()<CR>'             , {noremap = true , silent = true})
keymap('n' , '<leader>F' , ':lua vim.lsp.buf.formatting()<CR>'         , {noremap = true , silent = true})
keymap('v' , '<leader>F' , ':lua vim.lsp.buf.formatting()<CR>'         , {noremap = true , silent = true})

