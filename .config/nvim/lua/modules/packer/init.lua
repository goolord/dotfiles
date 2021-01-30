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
    use 'junegunn/vim-easy-align'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'tpope/vim-commentary'
    use 'tweekmonster/startuptime.vim'

    -- git
    use 'tpope/vim-fugitive'
    use { 'mattn/gist-vim', requires = { 'mattn/webapi-vim' } }

    -- colorsceme
    use { 'lifepillar/vim-gruvbox8' }

    -- nvim-lsp
    use 'neovim/nvim-lspconfig'
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    use 'lukas-reineke/format.nvim'
    use 'hrsh7th/nvim-compe'
    use { 'glepnir/lspsaga.nvim', requires = { 'neovim/nvim-lspconfig' } }

    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    local lualine = require('lualine')
    lualine.status()
    lualine.theme = 'gruvbox'

    use 'mhinz/vim-startify'

    -- filetype plugins
    use { 'elmcast/elm-vim', ft = 'elm' }
    use { 'LnL7/vim-nix', ft = 'nix'  }
    use { 'hellerve/carp-vim', ft = 'carp' }
    use { 'edwinb/idris2-vim', ft = 'idris2' }
    use { 
        'ndmitchell/ghcid', 
        rtp = 'plugins/nvim', 
        ft = { 'haskell', 'cabal', 'stack' }
    }
end)


return packer
