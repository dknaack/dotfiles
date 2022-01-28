call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

set title
set mouse=a
set clipboard+=unnamedplus
set wildmode=longest,list,full
set completeopt=menuone,noinsert,noselect
set termguicolors
set ignorecase smartcase incsearch
set splitbelow splitright
set ts=4 sw=4 sts=4 expandtab
set number relativenumber
set nofoldenable
set noshowmode noshowcmd
set complete=t,i
set statusline=\ %7{g:mode_string[mode()]}\ \|\ %f\ %m%=%l:%02c\ %y\ 

colorscheme tokyodark

let g:mapleader = ','
let g:python3_host_prog = '/usr/bin/python3'
let g:mode_string = { 'n': 'NORMAL', 'v': 'VISUAL', 'V': 'V-LINE',
    \ "\<C-V>": 'V-BLOCK', 'i': 'INSERT', 'R': 'REPLACE', 'c': 'COMMAND' }

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
autocmd FileType tex set spell spelllang=en,de

lua require('gitsigns').setup()
lua require('nvim-treesitter.configs').setup {highlight = {enable = true}}
