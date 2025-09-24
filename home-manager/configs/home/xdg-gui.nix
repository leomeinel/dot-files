/*
  File = xdg-gui.nix
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
  # XDG options
  xdg = {
    configFile = {
      # alacritty
      "alacritty/alacritty.toml" = {
        source = ../../files/.config/alacritty/alacritty.toml;
      };
      # eclipse-style-guides
      "eclipse-style-guides/java.xml" = {
        source = ../../files/.config/eclipse-style-guides/java.xml;
      };
      # eclipse-style-guides
      "gammastep/config.ini" = {
        source = ../../files/.config/gammastep/config.ini;
      };
      # Kvantum
      "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
      "Kvantum/kvantum.kvconfig" = {
        source = ../../files/.config/Kvantum/kvantum.kvconfig;
      };
      # npmrc
      "npm/npmrc" = {
        source = ../../files/.config/npm/npmrc;
      };
      # nwg-bar
      "nwg-bar/bar.json" = {
        source = ../../files/.config/nwg-bar/bar.json;
      };
      "nwg-bar/style.css" = {
        source = ../../files/.config/nwg-bar/style.css;
      };
      # r
      "r/Renviron" = {
        source = ../../files/.config/r/Renviron;
      };
      "r/Rprofile" = {
        source = ../../files/.config/r/Rprofile;
      };
      "r/lintr" = {
        source = ../../files/.config/r/lintr;
      };
      # radian/profile
      "radian/profile" = {
        source = ../../files/.config/radian/profile;
      };
      # sway
      "sway/config.d/autostart" = {
        source = ../../files/.config/sway/config.d/autostart;
      };
      "sway/config.d/bar" = {
        source = ../../files/.config/sway/config.d/bar;
      };
      "sway/config.d/idle" = {
        source = ../../files/.config/sway/config.d/idle;
      };
      "sway/config.d/input" = {
        source = ../../files/.config/sway/config.d/input;
      };
      "sway/config.d/key-bindings" = {
        source = ../../files/.config/sway/config.d/key-bindings;
      };
      "sway/config.d/output" = {
        source = ../../files/.config/sway/config.d/output;
      };
      "sway/config.d/theme" = {
        source = ../../files/.config/sway/config.d/theme;
      };
      "sway/scripts/input-graphics-tablet.sh" = {
        executable = true;
        source = ../../files/.config/sway/scripts/input-graphics-tablet.sh;
      };
      "sway/scripts/volume.sh" = {
        executable = true;
        source = ../../files/.config/sway/scripts/volume.sh;
      };
      "sway/config" = {
        source = ../../files/.config/sway/config;
      };
      # swaylock
      "swaylock/config" = {
        source = ../../files/.config/swaylock/config;
      };
      # swaync
      "swaync/config.json" = {
        source = ../../files/.config/swaync/config.json;
      };
      "swaync/style.css" = {
        source = ../../files/.config/swaync/style.css;
      };
      # Thunar
      "Thunar/uca.xml" = {
        force = true;
        source = ../../files/.config/Thunar/uca.xml;
      };
      # waybar
      "waybar/config.jsonc" = {
        source = ../../files/.config/waybar/config.jsonc;
      };
      "waybar/style.css" = {
        source = ../../files/.config/waybar/style.css;
      };
      "waybar/scripts/gammastep.sh" = {
        executable = true;
        source = ../../files/.config/gammastep/scripts/gammastep.sh;
      };
      # wofi
      "wofi/config" = {
        source = ../../files/.config/wofi/config;
      };
      "wofi/style.css" = {
        source = ../../files/.config/wofi/style.css;
      };
      # xdg
      "xdg-desktop-portal/sway-portals.conf" = {
        source = ../../files/.config/xdg-desktop-portal/sway-portals.conf;
      };
      # xfce4
      "xfce4/xfconf/xfce-perchannel-xml/thunar.xml" = {
        force = true;
        source = ../../files/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml;
      };
    };
    dataFile = {
      # backgrounds/arch-install
      "backgrounds/arch-install" = {
        recursive = true;
        source = ../../files/.local/share/backgrounds/arch-install;
      };
      # gnupg
      "gnupg/gpg-agent.conf" = {
        source = ../../files/.local/share/gnupg/gpg-agent.conf;
      };
    };
  };
}
