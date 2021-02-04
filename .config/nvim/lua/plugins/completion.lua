local keymap = vim.api.nvim_set_keymap
local compe = require'compe'

local source_ignored_filetype = { ignored_filetypes = {'clap_input' } }

compe.setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    throttle_time = 100,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,
    source = {
       path          = source_ignored_filetype,
       buffer        = source_ignored_filetype,
       nvim_lsp      = source_ignored_filetype,
       tags          = source_ignored_filetype,
       collaborators = { 
           filetypes = {'gitcommit'}, 
           ignored_filetypes = source_ignored_filetype["ignored_filetypes"]
       }
    }
})

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

