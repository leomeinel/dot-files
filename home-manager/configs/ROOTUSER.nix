/*
  File: ROOTUSER.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
*/

{
  ...
}:

{
  # Imports
  imports = [
    ../common-home.nix
  ];

  # Home options
  home = {
    username = "root";
    homeDirectory = "/root";
  };
}
