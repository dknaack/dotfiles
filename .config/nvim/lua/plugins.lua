local packer = require 'packer'
local o = vim.o

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(...) end
local function vim_set_keymap(...) vim.api.nvim_set_keymap(...) end

return packer.startup(function(use)
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
        config = {
            vim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
        },
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
