local packer = require 'packer'

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'mfussenegger/nvim-jdtls'
    use {
        'nvim-telescope/telescope.nvim', 
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
