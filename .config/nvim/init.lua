-- Plugins
require('plugins')
require('setup')

-- Set highlight on search
vim.o.hlsearch = true

-- Set working directory to current file
vim.o.autochdir = true

-- Make relative line numbers default
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.background = 'dark'
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Wrapping
vim.wo.cursorline = true
vim.wo.linebreak = true
vim.wo.wrap = false
vim.wo.foldmethod = 'marker'
vim.bo.modeline = true
vim.o.modeline = true

-- Tab
vim.bo.tabstop = 4
vim.o.tabstop = 4

vim.bo.shiftwidth = 4
vim.o.shiftwidth = 4

vim.bo.softtabstop = 4
vim.o.softtabstop = 4

vim.bo.expandtab = true
vim.o.expandtab = true

vim.o.smarttab = true

-- Indentation
vim.bo.autoindent = true
vim.o.autoindent = true

-- Swapfile
vim.bo.swapfile = false
vim.o.swapfile = false

-- Encoding
vim.o.encoding = 'UTF-8'

-- Syntax highlighting
vim.o.syntax = true

-- Auto completion
vim.o.wildmenu = true

-- Split sessions below
vim.o.splitbelow = true

-- Faster scrolling
vim.o.ttyfast = true
