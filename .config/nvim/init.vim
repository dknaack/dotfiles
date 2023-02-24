call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-dispatch'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

set title mouse=a clipboard+=unnamedplus
set colorcolumn=80 linebreak
set wildmode=longest,list,full
set complete=t,i completeopt=menuone,noinsert,noselect
set termguicolors
set ignorecase smartcase incsearch
set splitbelow splitright
set tabstop=4 shiftwidth=4 softtabstop=4
set nofoldenable noshowmode noshowcmd
set ls=3 statusline=\ %7{g:mode_string[mode()]}\ \|\ %f\ %m%=%l:%02c\ %y
set cinoptions=:0,t0,+4,(4,u0,Ws,m1,N-s,E-s,g0,h-s,P1
set list listchars=trail:·,tab:\ \ ,nbsp:␣
set number relativenumber
set errorformat^=%-G%f:%l:\ warning:%m
set makeprg=mk

colorscheme tokyodark
lua vim.diagnostic.config({ virtual_text = true })
lua require('dqf').setup()
lua require('nvim-surround').setup()

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:mapleader = ' '
let g:mode_string = { 'n': 'NORMAL', 'v': 'VISUAL', 'V': 'V-LINE',
	\ "\<C-V>": 'V-BLOCK', 'i': 'INSERT', 'R': 'REPLACE', 'c': 'COMMAND' }
let g:easy_align_delimiters = { '\': { 'pattern': '\\$' } }

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>ga  <cmd>Git add %<CR>
nnoremap <leader>grs <cmd>Git restore --staged %<CR>
nnoremap <leader>gcc <cmd>Git commit<CR>
nnoremap <leader>gca <cmd>Git commit --amend<CR>
nnoremap <leader>gs  <cmd>Git status<CR>
nnoremap <F5> <cmd>Make<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap Q @q
nnoremap Y y$
nnoremap <leader>m <cmd>Make<cr>
nnoremap <C-t> <cmd>Telescope tags<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-f> <cmd>Telescope grep_string<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap H h
nmap L l

autocmd BufRead,BufNewFile *.s set ft=nasm
autocmd BufRead,BufNewFile *.zig set ft=zig
autocmd BufRead,BufNewFile *.meta set ft=meta
autocmd FileType c,cpp setlocal noet ts=8 sw=8 | comp! gcc
autocmd FileType tex setlocal spell spelllang=en,de et ts=2 sw=2 cc=0
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType javascript,dart setlocal et ts=2 sw=2
autocmd FileType python setlocal et ts=4 sw=4

nnoremap <F3> :call TrimWhitespace()<CR>
autocmd BufWritePre * call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
