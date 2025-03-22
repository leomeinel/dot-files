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
  ...
}:

{
  # QT options
  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };
}
