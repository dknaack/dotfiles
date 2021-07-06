local packer = require 'packer'

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
