vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init({
    display = {
        open_cmd = 'leftabove 80vnew [packer]',
    }
})

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'Yggdroot/indentLine'
    use 'godlygeek/tabular'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'terrortylor/nvim-comment'
    use { 'tweekmonster/startuptime.vim', cmd = { 'StartupTime' } }
    use 'akinsho/nvim-toggleterm.lua'
    use 'hrsh7th/nvim-compe'

    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'mhinz/vim-startify'

    use { 'jremmen/vim-ripgrep', cmd = { 'Rg' } }
    use { 'rking/ag.vim', cmd = { 'Ag' } }

    use { 
        'liuchengxu/vim-clap', 
        requires = { 'liuchengxu/vista.vim' },
        run = function () vim.fn['clap#installer#build_maple']() end,
    }

    -- git
    use 'tpope/vim-fugitive'

    -- colorsceme
    use { 'lifepillar/vim-gruvbox8' }

    -- nvim-lsp
    use 'neovim/nvim-lspconfig'
    use  { 
        'RishabhRD/nvim-lsputils',
        requires = { 'RishabhRD/popfix' } 
    }

    -- filetype plugins
    -- ft broken for these kinds of plugins -_-
    -- use { 'elmcast/elm-vim' } -- , ft = 'elm' }
    use { 'LnL7/vim-nix' } -- , ft = 'nix' }
    use { 'hellerve/carp-vim' } -- , ft = 'carp' }
    use { 'edwinb/idris2-vim' } -- , ft = 'idris2' }

    use { 
        'ndmitchell/ghcid', 
        rtp = 'plugins/nvim', 
        cmd = { 'Ghcid', 'GhcidKill' },
    }
end)


return packer
