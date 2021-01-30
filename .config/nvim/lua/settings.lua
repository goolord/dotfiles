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

local options = {
    autoindent = true,
    autoread = true,
    backspace = 'indent,eol,start',
    bg = 'dark',
    completeopt = 'menuone,noselect',
    conceallevel = 0,
    cursorcolumn = false,
    cursorline = true,
    encoding = 'utf-8',
    errorbells = false,
    expandtab = true,
    fillchars = 'vert:│',
    foldexpr = 'nvim_treesitter#foldexpr()',
    foldlevel = 0,
    foldmethod = 'manual',
    formatoptions = 'jcroql',
    hidden = true,
    hlsearch = true,
    inccommand = 'nosplit',
    laststatus = 2,
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
    ruler = true,
    scrolloff = 5,
    shiftwidth = 2,
    shortmess = 'atToOc',
    showcmd = true,
    showmatch = true,
    showmode = true,
    sidescrolloff = 10,
    smarttab = true,
    softtabstop = 2,
    splitbelow = true,
    splitright = true,
    startofline = false,
    swapfile=false,
    t_Co = '256',
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
setOptions(options)

vim.cmd('syntax on')
vim.cmd('colorscheme gruvbox8')
vim.cmd('filetype plugin indent on')

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimsyn_embed = 'l'
vim.g.fugitive_no_maps = 1

