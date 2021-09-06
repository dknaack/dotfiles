return require('packer').startup(function(use)

    use {
        'wbthomason/packer.nvim',
        config = function()
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap = true, silent = true }

            buf_set_keymap('n', '<Leader>pc', '<cmd>PackerCompile<CR>', opts)
            buf_set_keymap('n', '<Leader>pi', '<cmd>PackerInstall<CR>', opts)
            buf_set_keymap('n', '<Leader>pu', '<cmd>PackerUpdate<CR>', opts)
            buf_set_keymap('n', '<Leader>ps', '<cmd>PackerSync<CR>', opts)
        end,
    }

    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'

    use {
        'tpope/vim-fugitive',
        config = function()
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap = true, silent = true }

            buf_set_keymap('n', '<Leader>gaa', '<cmd>Git add %<CR>', opts)
        end,
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            local lsp = require('lspconfig')

            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }

                buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            end

            local servers = { 'clangd' }
            for _, server in ipairs(servers) do
                lsp[server].setup {
                    on_attach = on_attach,
                }
            end
        end,
    }

    use 'kabouzeid/nvim-lspinstall'
    use 'mfussenegger/nvim-jdtls'
    use 'tikhomirov/vim-glsl'

    use 'liuchengxu/vista.vim'
    use 'wellle/context.vim'

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
            vim.cmd([[let g:completion_enable_snippet = 'UltiSnips']])
        end,
    }

    -- snippets
    use {
        'SirVer/ultisnips',
        config = function()
            vim.cmd([[let g:UltiSnipsEditSplit="vertical"]])
            vim.cmd([[let g:UltiSnipsExpandTrigger="<s-tab>"]])
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
