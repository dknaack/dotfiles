local packer = require 'packer'
local cmd = vim.cmd
local o = vim.o

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('compe').setup {
                enable = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = 'enable',
                throttle_time = 80,
                source_timeout = 200,
                resolve_timeout = 800,
                incomplete_delay = 400,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,
                documentation = {
                    border = { '', '' ,'', ' ', '', '', '', ' ' },
                    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                    max_width = 120,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1,
                },
                source = {
                    path = true,
                    buffer = true,
                    calc = true,
                    nvim_lsp = true,
                    nvim_lua = true,
                    vsnip = true,
                    ultisnips = true,
                    luasnip = true,
                },
            }
        end,
    }

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
