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
  fonts = {
    packages = with pkgs; [
      nerd-fonts.hasklug
      nerd-fonts.noto
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Hasklig" ];
        monospace = [ "HaskligMono" ];
        sansSerif = [ "Hasklig" ];
        serif = [ "Hasklig" ];
      };
    };
  };
}
