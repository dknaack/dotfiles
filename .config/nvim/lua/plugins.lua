return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'mfussenegger/nvim-jdtls'

    -- auto completion
    use 'hrsh7th/nvim-compe'

    -- snippets
    use {
        'norcalli/snippets.nvim',
        config = function()
            local snippets = require 'snippets'

            snippets.use_suggested_mappings()
            snippets.snippets = {
                _global = {
                    date = os.date,
                },
                c = {
                    include = [[#include ]],
                },
            }
        end,
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
