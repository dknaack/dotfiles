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

    use 'tpope/vim-dispatch'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'plasticboy/vim-markdown'

    use {
        'tpope/vim-fugitive',
        config = function()
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap = true, silent = true }

            buf_set_keymap('n', '<Leader>gaa', '<cmd>Git add %<CR>', opts)
            buf_set_keymap('n', '<Leader>gb', '<cmd>Git blame<CR>', opts)
        end,
    }

    use 'tikhomirov/vim-glsl'
    use 'ziglang/zig.vim'
    use 'andviro/nim.vim'

    use 'liuchengxu/vista.vim'

    -- alignment of '=', etc.
    use {
        'junegunn/vim-easy-align',
        config = function()
            vim.cmd([[xmap ga <Plug>(EasyAlign)]])
            vim.cmd([[nmap ga <Plug>(EasyAlign)]])
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
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    section_separators = '',
                    component_separators = '',
                },
            }
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
            local opts = { noremap = true }
            local function set_keymap(...)
                vim.api.nvim_set_keymap(...)
            end

            set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
            set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
            set_keymap('n', '<Leader>ft', '<cmd>Telescope tags<cr>', opts)
            set_keymap('n', '<Leader>fj', '<cmd>Telescope jumplist<cr>', opts)
            set_keymap('n', '<Leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
            set_keymap('n', '<Leader>fas', '<cmd>Telescope fuzzy_find<cr>', opts)
            set_keymap('n', '<Leader>fm', '<cmd>Telescope man_pages<cr>', opts)
        end,
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                highlight = { enable = true },
            }
        end,
    }

    -- git decorations
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    }
end)
