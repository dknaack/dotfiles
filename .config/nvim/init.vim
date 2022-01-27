call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lewis6991/gitsigns.nvim'

Plug 'plasticboy/vim-markdown'
Plug 'tikhomirov/vim-glsl'
Plug 'ziglang/zig.vim'
call plug#end()

set title
set showmode
set noruler
set mouse=a
set clipboard+=unnamedplus
set wildmode=longest,list,full
set termguicolors
set ignorecase smartcase incsearch
set splitbelow splitright
set ts=4 sw=4 sts=4 expandtab
set number relativenumber
set nofoldenable
set noshowcmd
set termguicolors

colorscheme tokyodark

let g:mapleader = ','

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap Q @q
nnoremap Y y$
nnoremap S :%s//g<left><left>
nnoremap <leader>m <cmd>Make<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

autocmd BufRead,BufNewFile * set cc=80
autocmd BufRead,BufNewFile *.h set ft=c
autocmd BufRead,BufNewFile *.s set ft=nasm
autocmd BufRead,BufNewFile *.tex set spell spelllang=en

source "snippet.vim"

lua require('gitsigns').setup()
lua << EOF
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    indent = { enable = true },
}
EOF
