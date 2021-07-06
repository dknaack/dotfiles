local packer = require 'packer'

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
