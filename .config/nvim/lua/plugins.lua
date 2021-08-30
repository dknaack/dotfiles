return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'mfussenegger/nvim-jdtls'
    use 'ziglang/zig.vim'
    use 'tikhomirov/vim-glsl'

    -- alignment of '=', etc.
    use {
        'junegunn/vim-easy-align',
        config = function()
            vim.cmd([[xmap ga <Plug>(EasyAlign)]])
            vim.cmd([[nmap ga <Plug>(EasyAlign)]])
        end,
    }

    -- debugging tools
    use {
        'puremourning/vimspector',
        config = function()
            vim.g.vimspector_enable_mappings = 'HUMAN'
        end,
    }

    -- edit markdown tables using sc-im
    use {
        'mipmip/vim-scimark',
        config = function()
            vim.g.scimCommand = '/usr/bin/sc-im'
        end,
    }

    -- colorscheme
    use {
        'tiagovla/tokyodark.nvim',
        config = [[vim.cmd('colorscheme tokyodark')]],
    }

    -- status line
    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false },
        config = function()
            local lualine = require 'lualine'

            lualine.setup {
                options = {
                    theme = 'auto',
                    section_separators = '',
                    component_separators = '',
                },
            }
        end,
    }

    -- icons
    use {
        'glepnir/lspsaga.nvim',
        disable = true,
        config = function()
            local saga = require('lspsaga')

            saga.init_lsp_saga {
                error_sign = '',
                warn_sign = '',
                hint_sign = '',
                infor_sign = '',
            }
        end,
    }

    -- file tree
    use {
        'preservim/nerdtree',
        config = function()
            -- auto open NERDTree
            vim.cmd([[autocmd VimEnter * NERDTree | wincmd p]])

            -- close NERDTree if it's the last window
            vim.cmd([[autocmd BufEnter * if tabpagenr('$') == 1]] ..
                [[ && winnr('$') == 1 && exists('b:NERDTree')]] ..
                [[ && b:NERDTree.isTabTree() | quit | endif]])
        end,
    }

    -- auto completion
    use {
        'nvim-lua/completion-nvim',
        config = function()
            vim.cmd([[autocmd BufEnter * lua require('completion').on_attach()]])

            -- TODO: change this to lua
            vim.cmd([[set completeopt=menuone,noinsert,noselect]])
            vim.cmd([[set shortmess+=c]])
            vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
            vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
            vim.cmd([[let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] ]])
            vim.cmd([[let g:completion_enable_snippet = 'snippets.nvim']])
        end,
    }

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
                    guard = [[
#ifndef ${1|S.v:upper():gsub("%s+", "_")}_H
#define ${1|S.v:upper():gsub("%s+", "_")}_H


#endif /* ${1|S.v:upper():gsub("%s+", "_")}_H */
                        ]],
                },
            }
        end,
    }

    -- fuzzy finder
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

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            local configs = require 'nvim-treesitter.configs'

            configs.setup {
                highlight = {
                    enable = true,
                }
            }
        end,
    }

    -- git decorations
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local gitsigns = require 'gitsigns'

            gitsigns.setup()
        end
    }
end)
