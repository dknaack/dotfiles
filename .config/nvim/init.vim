call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'tpope/vim-dispatch'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tikhomirov/vim-glsl'
Plug 'mbbill/undotree'
Plug 'dknaack/qf-diagnostics.nvim'
Plug 'dknaack/vim-metamath'
Plug 'windwp/nvim-autopairs'
Plug 'Julian/lean.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kaarmu/typst.vim'
call plug#end()

set title mouse=a clipboard+=unnamedplus
set colorcolumn=80 linebreak breakindent briopt=shift:4 showbreak
set wildmode=longest,list,full
set complete=t,i completeopt=menuone,noinsert,noselect
set termguicolors
set ignorecase smartcase incsearch
set splitbelow splitright
set tabstop=4 shiftwidth=4 softtabstop=4
set nofoldenable noshowmode noshowcmd
set ls=3 statusline=\ %7{g:mode_string[mode()]}\ \|\ %f\ %m%=%l:%02c\ %y
set cinoptions=:0,t0,+4,(4,u0,Ws,m1,N-s,E-s,g0,h-s,P1,l1
set list listchars=trail:·,tab:\ \ ,nbsp:␣
set number relativenumber
set errorformat^=%-G%f:%l:\ warning:%m
set makeprg=mk
set undofile

lua <<EOF
vim.diagnostic.config({ virtual_text = true })
require('nvim-surround').setup()
require('qf-diagnostics').setup()
require('nvim-autopairs').setup()
require('lean').setup({ mappings = true })
require('gitsigns').setup()
EOF

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:mapleader = ' '
let g:mode_string = { 'n': 'NORMAL', 'v': 'VISUAL', 'V': 'V-LINE',
	\ "\<C-V>": 'V-BLOCK', 'i': 'INSERT', 'R': 'REPLACE', 'c': 'COMMAND' }
let g:easy_align_delimiters = { '\': { 'pattern': '\\$' } }
let &l:briopt = 'shift:'..shiftwidth()

colorscheme tokyodark
hi clear Typedef
hi clear Identifier
hi clear Function
hi clear Constant
hi clear StorageClass
hi clear @type.qualifier
hi clear @text.note
hi link StorageClass Keyword
hi link Typedef Type
hi link @namespace NONE
hi link @type.qualifier Keyword
hi link @text.note Constant

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>gaa <cmd>Git add %<CR>
nnoremap <leader>gap <cmd>Git add -p %<CR>
nnoremap <leader>grs <cmd>Git restore --staged %<CR>
nnoremap <leader>gcc <cmd>Git commit<CR>
nnoremap <leader>gca <cmd>Git commit --amend<CR>
nnoremap <leader>gss <cmd>Git stash<CR>
nnoremap <leader>gsp <cmd>Git stash pop<CR>
nnoremap <leader>gds <cmd>Git diff --staged %<CR>
nnoremap <leader>gg <cmd>Git status<CR>
nnoremap <leader>gb <cmd>Git blame<CR>
nnoremap <leader>gl <cmd>0Gclog<CR>
nnoremap <leader>gr <cmd>Git rebase -i<CR>
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
autocmd BufRead,BufNewFile *.tex set ft=tex
autocmd BufRead,BufNewFile *.typ set ft=typst et ts=2 sw=2
autocmd BufRead,BufNewFile TODO set ft=markdown et ts=2 sw=2
autocmd FileType c,cpp,glsl setlocal noet ts=4 sw=4 | comp! gcc
autocmd FileType tex setlocal spell spelllang=en,de et ts=2 sw=2 cc=0
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2 briopt=shift:2
autocmd FileType html,javascript,typescript,dart setlocal et ts=2 sw=2
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType haskell setlocal et ts=2 sw=2

nnoremap <F3> :call TrimWhitespace()<CR>
autocmd BufWritePre *.c,*.cpp,*.h,*.tex call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
