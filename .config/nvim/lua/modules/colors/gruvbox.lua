local function hl(group, options)
    local bg = options.bg == nil and '' or 'guibg=' .. options.bg
    local fg = options.fg == nil and '' or 'guifg=' .. options.fg
    local gui = options.gui == nil and '' or 'gui=' .. options.gui

    vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

function ApplyGruvbox()
    local highlights = {
        -- normal stuff
        {'Normal', {bg = 'NONE'}},
        {'SignColumn', {bg = 'NONE'}},
        {'ColorColumn', {bg = 'NONE', fg = '#928374'}},
        {'IncSearch', {bg = '#928374', fg = '#282828', gui = 'bold'}},
        -- {'VertSplit', {bg = '#3C3836', fg = '#3C3836'}},

        -- signify
        {'SignifySignAdd', {fg = '#458588', bg = 'NONE'}},
        {'SignifySignChange', {fg = '#D79921', bg = 'NONE'}},
        {'SignifySignDelete', {fg = '#CC241D', bg = 'NONE'}},

        -- luatree
        {'NvimTreeFolderIcon', {fg = '#D79921'}},
        {'NvimTreeIndentMarker', {fg = '#928374'}},

        -- telescope
        {'TelescopeSelection', {bg = 'NONE', fg = '#D79921', gui = 'bold'}},
        {'TelescopeMatching', {bg = 'NONE', fg = '#D79921', gui = 'bold'}},
        {'TelescopePreviewBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopePromptBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopeResultsBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopePromptPrefix', {bg = 'NONE', fg = '#D79921'}},

        -- diagnostic-nvim
        {'LspDiagnosticsDefaultError', {bg = 'NONE', fg = '#FB4934'}},
        {'LspDiagnosticsDefaultInformation', {bg = 'NONE', fg = '#D3869B'}},
        {'LspDiagnosticsDefaultWarning', {bg = 'NONE', fg = '#FABD2F'}},
        {'LspDiagnosticsDefaultHint', {bg = 'NONE', fg = '#83A598'}},

        -- lspsaga
        {'LspFloatWinBorder', {bg = 'NONE', fg = '#928374'}},
        {'ProviderTruncateLine', {bg = 'NONE', fg = '#928374'}},
        {'LspSagaDocTruncateLine', {bg = 'NONE', fg = '#928374'}},
        {'LspSagaCodeActionTruncateLine', {bg = 'NONE', fg = '#928374'}},
    }

    for _, highlight in pairs(highlights) do hl(highlight[1], highlight[2]) end
end

-- automatically override colourscheme
vim.cmd('augroup NewColor')
vim.cmd('au!')
vim.cmd('au ColorScheme gruvbox8 call v:lua.ApplyGruvbox()')
vim.cmd('augroup END')

vim.cmd('colors gruvbox8')
