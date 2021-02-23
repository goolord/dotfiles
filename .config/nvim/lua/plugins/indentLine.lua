return function()
    vim.g.indentLine_char = '|'
    vim.g.indentLine_faster = 1
    vim.g.indentLine_setColors = 1
    vim.g.indentLine_fileTypeExclude = {
        'help',
        'nerdtree',
        'startify',
        'Preview',
        '__doc__',
        'peekaboo',
        'man',
        'trans',
        'fzf',
        'markdown',
        'log',
        'terminal',
    }
end
