vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init()

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'godlygeek/tabular'
    use { 'terrortylor/nvim-comment', config = require('plugins.nvim-comment') }
    use { 'akinsho/nvim-toggleterm.lua', config = require('plugins.toggleterm') }
    use { 'hrsh7th/nvim-compe', config = require('plugins.completion') }
    use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
    use { 'tweekmonster/startuptime.vim', cmd = { 'StartupTime' } }
    
    use { 'jremmen/vim-ripgrep', cmd = 'Rg' }

    -- gui
    use { 'Yggdroot/indentLine', config = require('plugins.indentLine') }
    use { 'mhinz/vim-startify', config = require('plugins.startify') }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = require('plugins.nvimTree')
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = require('plugins.statusline')
    }

    use {
        'liuchengxu/vim-clap',
        run = function () vim.fn['clap#installer#build_maple']() end,
        config = require('plugins.clap')
    }
    use 'goolord/vim-clap-gruvbox'

    -- git
    use 'tpope/vim-fugitive'

    -- colorsceme
    use {
        'lifepillar/vim-gruvbox8',
        config = require('plugins.gruvbox')
    }

    -- nvim-lsp
    use {
        'neovim/nvim-lspconfig',
        config = require('modules.lsp'),
        ft = { 'haskell', 'rust' }
    }

    use '~/Dev/nvim-clap-lsp'
    use 'kosayoda/nvim-lightbulb'
    use {
        'folke/trouble.nvim',
        config = require('plugins.trouble'),
    }

    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     config = require('plugins.treesitter'),
    --     run = function () vim.cmd('TSUpdate') end,
    -- }

    -- filetype plugins
    use 'LnL7/vim-nix'
    use 'edwinb/idris2-vim'
    use 'cespare/vim-toml'
    use { '~/Dev/collaborators.vim', ft = 'gitcommit' }
    use { 'whonore/Coqtail', ft = 'coq' }

    use {
        'ndmitchell/ghcid',
        rtp = 'plugins/nvim',
        cmd = { 'Ghcid', 'GhcidKill' },
    }
end)

return packer
