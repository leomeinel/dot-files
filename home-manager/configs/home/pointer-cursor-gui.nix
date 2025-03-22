/*
  File = pointer-cursor-gui.nix
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
  # pointerCursor options
  home.pointerCursor = with pkgs; {
    name = "phinger-cursors-dark";
    package = phinger-cursors;
    size = 24;
    gtk.enable = true;
  };
}
