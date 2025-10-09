/*
  File: fonts-gui.nix
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
  # Fontconfig options
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "HasklugNerdFont" ];
      monospace = [ "HasklugNerdFontMono" ];
      sansSerif = [ "HasklugNerdFont" ];
      serif = [ "HasklugNerdFont" ];
    };
  };
}
