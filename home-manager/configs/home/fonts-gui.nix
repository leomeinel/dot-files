/*
  File = fonts-gui.nix
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

{
  # Fontconfig options
  fonts .fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Hasklig" ];
      monospace = [ "HaskligMono" ];
      sansSerif = [ "Hasklig" ];
      serif = [ "Hasklig" ];
    };
  };
}
