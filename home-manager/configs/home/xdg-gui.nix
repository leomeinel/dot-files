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
  ...
}:

{
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
      # Kvantum
      "Kvantum/kvantum.kvconfig" = {
        source = ../../files/.config/Kvantum/kvantum.kvconfig;
      };
      # nwg-bar
      "nwg-bar/bar.json" = {
        source = ../../files/.config/nwg-bar/bar.json;
      };
      "nwg-bar/style.css" = {
        source = ../../files/.config/nwg-bar/style.css;
      };
      # qt6ct
      "qt6ct/qt6ct.conf" = {
        source = ../../files/.config/qt6ct/qt6ct.conf;
      };
      # r
      "r/.Renviron" = {
        source = ../../files/.config/r/.Renviron;
      };
      "r/.Rprofile" = {
        source = ../../files/.config/r/.Rprofile;
      };
      "r/.lintr" = {
        source = ../../files/.config/r/.lintr;
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
      "sway/config.d/reload" = {
        source = ../../files/.config/sway/config.d/reload;
      };
      "sway/config.d/theme" = {
        source = ../../files/.config/sway/config.d/theme;
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
      "waybar/config" = {
        source = ../../files/.config/waybar/config;
      };
      "waybar/style.css" = {
        source = ../../files/.config/waybar/style.css;
      };
      # wofi
      "wofi/config" = {
        source = ../../files/.config/wofi/config;
      };
      "wofi/style.css" = {
        source = ../../files/.config/wofi/style.css;
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
