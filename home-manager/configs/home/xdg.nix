/*
  File: xdg.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  installEnv,
  pkgs,
  ...
}:

{
  xdg = {
    enable = true;
    configFile = {
      # git
      "git/config" = {
        text =
          builtins.replaceStrings
            [
              "REPLACE_GIT_EMAIL"
              "REPLACE_GIT_NAME"
              "REPLACE_GIT_SIGNINGKEY"
              "REPLACE_GIT_GPGSIGN"
              "REPLACE_PATH_NVIM"
            ]
            [
              "${installEnv.GIT_EMAIL}"
              "${installEnv.GIT_NAME}"
              "${installEnv.GIT_SIGNINGKEY}"
              "${installEnv.GIT_GPGSIGN}"
              "${pkgs.neovim}/bin/nvim"
            ]
            builtins.readFile
            ../../files/.config/git/config;
      };
    };
  };
}
