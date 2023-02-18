call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ludovicchabant/vim-gutentags'
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
set cinoptions=:0,t0,(8,Ws,k8,m1,N-s,l8,g0
set list listchars=trail:·,tab:\ \ ,nbsp:␣
set nu rnu
set errorformat^=%-G%f:%l:\ warning:%m
set makeprg=mk

colorscheme tokyodark

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:mapleader = ' '
let g:maplocalleader = ','
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
nnoremap <leader>m <cmd>Make<cr>
nnoremap <C-t> <cmd>Tags<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap H h
nmap L l
nmap <C-p> :Files<CR>

nnoremap <leader>ga  :Git add %<CR>
nnoremap <leader>grs :Git restore --staged %<CR>
nnoremap <leader>gcc :Git commit<CR>
nnoremap <leader>gca :Git commit --amend<CR>
nnoremap <leader>gs  :Git status<CR>
nnoremap <F5> :Make<CR>

autocmd BufRead,BufNewFile * set cc=80
autocmd BufRead,BufNewFile *.s set ft=nasm
autocmd BufRead,BufNewFile *.zig set ft=zig
autocmd BufRead,BufNewFile *.tex set ft=tex
autocmd BufRead,BufNewFile *.meta set ft=meta
autocmd BufRead,BufNewFile latexmkrc set ft=perl
autocmd FileType tex set spell spelllang=en,de et ts=4 sw=4
autocmd FileType markdown nnoremap <CR> f]hvi]g<C-]>
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType javascript,dart setlocal et ts=2 sw=2
autocmd FileType python set et ts=4 sw=4
autocmd VimLeave ~/notes/*.md silent !make &
autocmd BufWritePre *.{c,h,cpp} :%s/\s\+$//e

lua require('gitsigns').setup()
lua require('nvim-treesitter.configs').setup {highlight = {enable = true}}

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
