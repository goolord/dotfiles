local keymap = vim.api.nvim_set_keymap

require('compe').setup({
    enabled = true,
    autocomplete = false,
    debug = false,
    min_length = 1,
    throttle_time = 100,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,
    source = {path = true, buffer = true, nvim_lsp = true, tags = true}
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
    'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete() | <C-p>',
    {silent = true, noremap = true, expr = true})

