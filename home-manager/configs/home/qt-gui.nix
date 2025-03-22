/*
  File = qt-gui.nix
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
  # QT options
  qt = with pkgs; {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "gtk2";
      package = adwaita-qt;
    };
  };
}
