/*
  File = xdg.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  ...
}:

{
  xdg = {
    enable = true;
    configFile = {
      # git
      "git/config" = {
        text = ''
          [user]
          email = "leo@meinel.dev"
          name = "Leopold Johannes Meinel"
          signingkey = REPLACE_GIT_SIGNING_KEY

          [core]
          editor = nvim
          pager = delta
          autocrlf = input

          [init]
          defaultBranch = main

          [pull]
          rebase = true

          [commit]
          gpgsign = true

          [merge]
          conflictstyle = diff3

          [diff]
          colorMoved = default

          [interactive]
          diffFilter = delta --color-only --features=interactive
          [add.interactive]
          useBuiltin = false

          [delta]
          navigate = true
          light = false
          features = decorations
          [delta "interactive"]
          keep-plus-minus-markers = false
          [delta "decorations"]
          commit-decoration-style = blue ol
          commit-style = raw
          file-style = omit
          hunk-header-decoration-style = blue box
          hunk-header-file-style = red
          hunk-header-line-number-style = "#067a00"
          hunk-header-style = file line-number syntax

          [credential]
          helper = /usr/lib/git-core/git-credential-libsecret
        '';
      };
      # nvim
      "nvim/lua/plugin/gruvbox-nvim.lua" = {
        text = ''
          require'gruvbox'.setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
              strings = true,
              emphasis = true,
              comments = true,
              operators = false,
              folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "",
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
          })
          vim.cmd("colorscheme gruvbox")
        '';
      };
      "nvim/lua/plugin/nvim-tree-lua.lua" = {
        text = ''
          require'nvim-tree'.setup({
            sort = {
              sorter = "case_sensitive",
            },
            view = {
              width = 30,
            },
            renderer = {
              group_empty = true,
            },
            filters = {
              dotfiles = true,
            },
          })
        '';
      };
      "nvim/lua/plugin/nvim-web-devicons.lua" = {
        text = ''
          require'nvim-web-devicons'.setup {
            color_icons = true;
            default = true;
            strict = true;
          }
        '';
      };
      "nvim/init.lua" = {
        text = ''
          -- disable netrw
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1

          -- Set highlight on search
          vim.o.hlsearch = true

          -- Set working directory to current file
          vim.o.autochdir = true

          -- Make relative line numbers default
          vim.wo.number = true
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

          -- Wrapping
          vim.wo.wrap = false

          -- Cursor line
          vim.wo.cursorline = true

          -- Tab
          vim.o.tabstop = 4
          vim.o.shiftwidth = 4
          vim.o.softtabstop = 4
          vim.o.expandtab = true
          vim.o.smarttab = true

          -- Indentation
          vim.o.autoindent = true

          -- Swapfile
          vim.o.swapfile = false

          -- Encoding
          vim.o.encoding = 'UTF-8'

          -- Syntax highlighting
          vim.o.syntax = 'ON'

          -- Auto completion
          vim.o.wildmenu = true

          -- Split sessions below
          vim.o.splitbelow = true

          -- Faster scrolling
          vim.o.ttyfast = true
        '';
      };
    };
  };
}
