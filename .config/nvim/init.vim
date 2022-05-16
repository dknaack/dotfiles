call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jansedivy/jai.vim'
Plug 'https://tildegit.org/sloum/gemini-vim-syntax'
Plug 'Tetralux/odin.vim'
Plug 'mattn/emmet-vim'
call plug#end()

set title
set mouse=a
set clipboard+=unnamedplus
set wildmode=longest,list,full
set completeopt=menuone,noinsert,noselect
set termguicolors
set ignorecase smartcase incsearch
set splitbelow splitright
set ts=4 sw=4 sts=4
set nofoldenable noshowmode noshowcmd
set complete=t,i
set statusline=\ %7{g:mode_string[mode()]}\ \|\ %f\ %m%=%l:%02c\ %y\ 
set cinoptions=:0,t0,(4,Ws,k8,m1,N-s,l4,g0
set list listchars=trail:·,tab:\ \ ,nbsp:␣
set nu rnu
set errorformat^=%-G%f:%l:\ warning:%m

colorscheme tokyodark

let g:mapleader = ','
let g:python3_host_prog = '/usr/bin/python3'
let g:mode_string = { 'n': 'NORMAL', 'v': 'VISUAL', 'V': 'V-LINE',
            \ "\<C-V>": 'V-BLOCK', 'i': 'INSERT', 'R': 'REPLACE', 'c': 'COMMAND' }
let g:easy_align_delimiters = { '\': { 'pattern': '\\$' } }

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-H> <C-w><C-H>
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-w><C-L>
nnoremap Q @q
nnoremap Y y$
nnoremap S :%s//g<left><left>
nnoremap <leader>m <cmd>make<cr>
nnoremap <CR> g<C-]>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap H h
nmap L l
nmap <C-p> :Files<CR>

nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gcc :Git commit<CR>
nnoremap <leader>gca :Git commit --amend<CR>
nnoremap <leader>gs :Git status<CR>

autocmd BufRead,BufNewFile * set cc=80
autocmd BufRead,BufNewFile *.h set ft=c
autocmd BufRead,BufNewFile *.s set ft=nasm
autocmd BufRead,BufNewFile *.zig set ft=zig
autocmd FileType tex set spell spelllang=en,de
autocmd FileType markdown nnoremap <CR> f]hvi]g<C-]>
autocmd FileType c set tags+=~/.config/nvim/tags
autocmd FileType javascript setlocal et ts=2 sw=2
autocmd VimLeave ~/notes/*.md silent !make &
autocmd BufWritePre *.{c,h,cpp} :%s/\s\+$//e

lua require('gitsigns').setup()
lua require('nvim-treesitter.configs').setup {highlight = {enable = true}}

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
