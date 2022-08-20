-- Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Plugins
require('plugins')

-- Set highlight on search
vim.o.hlsearch = true

-- Set working directory to current file
vim.o.autochdir = true

-- Make line numbers default
vim.wo.number = true

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
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  overrides = {},
})
vim.cmd([[colorscheme gruvbox]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Wrapping
vim.wo.cursorline = true
vim.wo.linebreak = true
vim.wo.wrap = false
vim.o.textwidth = 80
vim.bo.textwidth = 80
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

vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function()
        require "ginit"
    end
})
