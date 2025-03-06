/*
  File: YOUTUBEUSER.nix
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
    ../common-home-gui.nix
  ];

  # Home options
  home = {
    username = "REPLACE_YOUTUBEUSER";
    homeDirectory = "/home/REPLACE_YOUTUBEUSER";
  };
}
