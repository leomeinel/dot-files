vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Gruvbox
    require('colors/gruvbox')
    use { "ellisonleao/gruvbox.nvim" }
    
    -- nvim-web-icons
    require('plug/nvim-web-devicons')
    use { 'kyazdani42/nvim-web-devicons' }
    
    -- nvim-tree
    require('plug/nvim-tree')
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' }
end)
