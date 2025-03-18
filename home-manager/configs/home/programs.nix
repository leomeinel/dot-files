/*
  File = programs.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  pkgs,
  ...
}:

# Vscode options
{
  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = builtins.readFile ../../files/.config/nvim/init.lua;
      plugins = with pkgs.vimPlugins; [
        {
          plugin = gruvbox-nvim;
          type = "lua";
          config = builtins.readFile ../../files/.config/nvim/lua/plugin/gruvbox-nvim.lua;
        }
        {
          plugin = nvim-tree-lua;
          type = "lua";
          config = builtins.readFile ../../files/.config/nvim/lua/plugin/nvim-tree-lua.lua;
        }
        {
          plugin = nvim-web-devicons;
          type = "lua";
          config = builtins.readFile ../../files/.config/nvim/lua/plugin/nvim-web-devicons.lua;
        }
      ];
    };
  };
}
