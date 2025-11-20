/*
  File: xdg.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
*/

{
  installEnv,
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
            ]
            [
              "${installEnv.GIT_EMAIL}"
              "${installEnv.GIT_NAME}"
              "${installEnv.GIT_SIGNINGKEY}"
              "${installEnv.GIT_GPGSIGN}"
            ]
            (builtins.readFile ../../files/.config/git/config);
      };
    };
  };
}
