local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- options
o.title = true
o.showmode = false
o.ruler = false
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.encoding = 'utf-8'
o.wildmode = 'longest,list,full'

o.ignorecase = true
o.ignorecase = true
o.smartcase = true
o.incsearch = true

o.splitbelow = true
o.splitright = true

o.termguicolors = true

-- window options
wo.number = true
wo.relativenumber = true
wo.foldenable = false

-- buffer options
bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
cmd('set ts=4 sw=4 expandtab')

g.mapleader = ','

cmd('autocmd BufWritePost plugins.lua PackerCompile')
cmd([[autocmd FileType c,cpp,java,lua autocmd BufWritePre <buffer> %s/\s\+$//e]])

-- faster window switching
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>m', ':make<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', 'Q', '@q', { noremap = true })

-- set .h file to c file type
cmd('autocmd BufEnter *.h set ft=c')

-- load other modules
require 'plugins'

-- set nasm to the default syntax for assembly
cmd('au BufRead,BufNewFile *.s set ft=nasm')
