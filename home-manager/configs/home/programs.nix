/*
  File: programs.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  pkgs,
  ...
}:

{
  # Programs options
  programs = {
    home-manager.enable = true;
    neovim =
      let
        toLuaFile = file: ''
          lua <<EOF
          ${builtins.readFile file}
          EOF
        '';
      in
      {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraLuaConfig = builtins.readFile ../../files/programs/neovim/init.lua;
        plugins = with pkgs.vimPlugins; [
          {
            plugin = gruvbox-nvim;
            config = toLuaFile ../../files/programs/neovim/plugin/gruvbox-nvim.lua;
          }
          {
            plugin = nvim-tree-lua;
            config = toLuaFile ../../files/programs/neovim/plugin/nvim-tree-lua.lua;
          }
          {
            plugin = nvim-web-devicons;
            config = toLuaFile ../../files/programs/neovim/plugin/nvim-web-devicons.lua;
          }
        ];
      };
  };
}
