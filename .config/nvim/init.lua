local plugins = require 'plugins'
local lsp = require 'lsp'
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
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

cmd('autocmd BufWritePost plugins.lua PackerCompile')
