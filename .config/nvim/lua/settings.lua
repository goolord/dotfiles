local function setOptions(options)
    for key, val in pairs(options) do
        if val == true then
            vim.api.nvim_command('set ' .. key)
        elseif val == false then
            vim.api.nvim_command('set no' .. key)
        else
            vim.api.nvim_command('set ' .. key .. '=' .. val)
        end
    end
end

setOptions {
    autoindent = true,
    backspace = 'indent,eol,start',
    bg = 'dark',
    completeopt = 'menu,menuone,noselect',
    cursorline = true,
    directory = '$HOME/.swap//',
    errorbells = false,
    expandtab = true,
    fillchars = 'vert:│',
    formatoptions = 'jcroql',
    hidden = true,
    hlsearch = true,
    inccommand = 'nosplit',
    lazyredraw = true,
    linebreak = true,
    list = true,
    listchars = 'tab:»-»',
    mouse = 'a',
    nofoldenable = true,
    number = true,
    pumblend = 10,
    pumheight = 15,
    pyxversion = 3,
    scrolloff = 5,
    shiftwidth = 2,
    shortmess = 'atToOc',
    showcmd = true,
    showmode = true,
    sidescrolloff = 10,
    smarttab = true,
    softtabstop = 2,
    startofline = false,
    t_Co = '256',
    tags = './tags;,tags;./.tags;,.tags;',
    tabstop = 2,
    termguicolors = true,
    title = true,
    ttimeoutlen = 50,
    undodir = '$HOME/.swap/',
    undofile = true,
    undolevels = 1000,
    undoreload = 10000,
    updatetime = 300,
    wildmenu = true,
    wildmode = 'full',
    wildoptions = 'pum',
    winblend = 0,
    wrap = true,
    writebackup = true
}

vim.cmd('syntax on')
vim.cmd('colorscheme gruvbox8')
vim.cmd('filetype plugin indent on')
vim.cmd('syntax sync minlines=256')

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.vimsyn_embed = 'l'

vim.cmd('autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:ghcid_command = "./tools/ghcid.sh --no-height-limit --reverse-errors --clear"')

vim.g.hs_highlight_debug = 1

vim.cmd('set guifont=FiraCode\\ Nerd\\ Font,monospace:h20')
vim.g.neovide_cursor_animation_length = 0

