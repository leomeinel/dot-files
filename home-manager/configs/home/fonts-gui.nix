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
  ...
}:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Hasklug Nerd Font Mono" ];
      monospace = [ "Hasklug Nerd Font Mono" ];
      sansSerif = [ "Hasklug Nerd Font Mono" ];
      serif = [ "Hasklug Nerd Font Mono" ];
    };
  };
}
