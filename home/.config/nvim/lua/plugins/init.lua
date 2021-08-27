vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init()

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'godlygeek/tabular'
    use { 'terrortylor/nvim-comment', config = require('plugins.nvim-comment') }
    use { 'akinsho/nvim-toggleterm.lua', config = require('plugins.toggleterm') }
    use { 'tweekmonster/startuptime.vim', cmd = { 'StartupTime' } }
    use { 
        'wincent/ferret', 
        cmd = {
            'Ack', 'Ack!', 'Acks', 
            'Back', 'Back!',
            'Black', 'Black!',
            'Quack', 'Quack!',
            'Lack', 'Lack!', 'Lacks',
            'FerretCancelAsync', 'FerretPullAsync',
            'Qargs', 'Largs'
        } 
    }

    -- completion
    use { 'onsails/lspkind-nvim' }
    use { '~/Dev/nvim-cmp', config = require('plugins.completion') }
    -- use { 'hrsh7th/nvim-cmp', config = require('plugins.completion') }
    -- sources
    use { 'tzachar/cmp-tabnine' , requires = 'tzachar/cmp-tabnine', run = './install.sh'}
    use { 'hrsh7th/cmp-buffer'  , requires = 'tzachar/cmp-tabnine' }
    use { 'hrsh7th/cmp-nvim-lsp', requires = 'tzachar/cmp-tabnine' }
    use { 'hrsh7th/cmp-path'    , requires = 'tzachar/cmp-tabnine' }
    use { 'hrsh7th/cmp-emoji'   , requires = 'tzachar/cmp-tabnine' }
    use { 'hrsh7th/cmp-calc'    , requires = 'tzachar/cmp-tabnine' }
    use { 'hrsh7th/cmp-vsnip'   , requires = 'tzachar/cmp-tabnine' }
    use { 
        'hrsh7th/vim-vsnip', 
        requires = 'hrsh7th/vim-vsnip-integ',
        config = require('plugins.snippets')
    }

    -- gui
    use { 'lukas-reineke/indent-blankline.nvim', config = require('plugins.indent-blankline') }
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
    --     run = ':TSUpdate',
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
