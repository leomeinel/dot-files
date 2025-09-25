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
  pkgs,
  config,
  ...
}:

{
  # GTK Options
  gtk = {
    enable = true;
    font = with pkgs; {
      package = nerd-fonts.hasklug;
      name = "HasklugNerdFont";
      size = 10;
    };
    iconTheme = with pkgs; {
      package = adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = with pkgs; {
      package = gnome-themes-extra;
      name = "Adwaita";
    };
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
