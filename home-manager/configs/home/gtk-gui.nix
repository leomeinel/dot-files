/*
  File = gtk-gui.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/
{
  config,
  ...
}:

{
  # GTK Options
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };
    font = {
      name = "Noto Sans";
      size = 10;
    };
    iconTheme.name = "Papirus-Dark";
    theme.name = "Arc-Dark";
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-enable-animations = 1
        gtk-primary-button-warps-slider = 0
        gtk-toolbar-style = 3
        gtk-menu-images = 1
        gtk-button-images = 1
      '';
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module";
      gtk-primary-button-warps-slider = false;
      gtk-toolbar-style = 3;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = false;
    };
  };
}
