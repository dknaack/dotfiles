return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'mfussenegger/nvim-jdtls'
    use 'ziglang/zig.vim'

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
        'hrsh7th/nvim-compe',
        config = function()
            local compe = require 'compe'

            compe.setup {
                enabled = true,
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
                    vsnip = false,
                    ultisnips = false,
                    luasnip = false,
                },
            }

            vim.o.completeopt = 'menuone,noselect'

            local args = { noremap = true, expr = true, silent = true }

            -- use tab to navigate completion menu
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local check_back_space = function()
                local col = vim.fn.col('.') - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
            end

            -- Use (s-)tab to:
            --- move to prev/next item in completion menuone
            --- jump to prev/next snippet's placeholder
            _G.tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-n>"
                --elseif vim.fn['vsnip#available'](1) == 1 then
                --    return t "<Plug>(vsnip-expand-or-jump)"
                elseif check_back_space() then
                    return t "<Tab>"
                else
                    return vim.fn['compe#complete']()
                end
            end
            _G.s_tab_complete = function()
                if vim.fn.pumvisible() == 1 then
                    return t "<C-p>"
                --elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                --    return t "<Plug>(vsnip-jump-prev)"
                else
                    -- If <S-Tab> is not working in your terminal, change it to <C-h>
                    return t "<S-Tab>"
                end
            end

            vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
            vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
            vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
            vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

            -- auto complete on enter
            vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
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
                    include = [[#include ]],
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
