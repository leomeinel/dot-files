/*
  File: HOMEUSER.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  lib,
  config,
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    ../common-home-gui.nix
  ];

  # Home options
  home = {
    username = "REPLACE_HOMEUSER";
    homeDirectory = "/home/REPLACE_HOMEUSER";
  };
}
