/*
  File = file.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  config,
  ...
}:

{
  # File options
  home.file = {
    "${config.home.homeDirectory}/.bash_aliases" = {
      source = ../../files/.bash_aliases;
    };
    "${config.home.homeDirectory}/.bash_logout" = {
      source = ../../files/.bash_logout;
    };
    "${config.home.homeDirectory}/.bash_profile" = {
      source = ../../files/.bash_profile;
    };
    "${config.home.homeDirectory}/.bashrc" = {
      source = ../../files/.bashrc;
    };
  };
}
