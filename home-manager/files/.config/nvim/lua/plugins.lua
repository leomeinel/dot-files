vim.pack.add({
    "https://github.com/nvim-tree/nvim-tree.lua"
})
require("nvim-tree").setup({
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
        dotfiles = false,
    },
})

vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons"
})
require("nvim-web-devicons").setup({
    color_icons = true,
    default = true,
    strict = true,
})

vim.pack.add({
    "https://github.com/olimorris/onedarkpro.nvim",
})
vim.cmd("colorscheme onedark")
