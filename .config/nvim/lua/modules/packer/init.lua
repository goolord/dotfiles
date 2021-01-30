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
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', opt = true }
    use 'junegunn/vim-easy-align'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'mnabila/vim-header'
    use 'psliwka/vim-smoothie'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
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
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'hrsh7th/nvim-compe', requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ' } }
    use { 'glepnir/lspsaga.nvim', requires = { 'neovim/nvim-lspconfig' } }

    -- filetype plugins
    use { 'elmcast/elm-vim' }
    use { 'ndmitchell/ghcid', rtp = 'plugins/nvim' }
end)

return packer
