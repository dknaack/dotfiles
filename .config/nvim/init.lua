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

-- window options
wo.number = true
wo.relativenumber = true

-- buffer options
bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

g.mapleader = ','

cmd('autocmd BufWritePost plugins.lua PackerCompile')
cmd([[autocmd FileType c,cpp,java,lua autocmd BufWritePre <buffer> %s/\s\+$//e]])

-- faster window switching
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true })

-- load other modules
require 'plugins'
require 'lsp'
