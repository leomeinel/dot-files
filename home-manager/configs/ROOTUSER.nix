/*
  File: ROOTUSER.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  ...
}:

{
  # Imports
  imports = [
    ../common-home-cli.nix
  ];

  # Home options
  home = {
    username = "root";
    homeDirectory = "/root";
  };
}
