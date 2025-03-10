/*
  File: common-home-gui.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    ./configs/home/gtk-gui.nix
    ./configs/home/programs-gui.nix
    ./configs/home/systemd-gui.nix
    ./configs/home/xdg-gui.nix
  ];

  # Nixpkgs options
  nixpkgs = {
    overlays = [ ];
    config = { };
  };

  # Home options
  home = {
    # Packages
    packages =
      with pkgs;
      let
        R-with-my-packages = rWrapper.override {
          packages = with rPackages; [
            httpgd
            languageserver
          ];
        };
      in
      [
        cmake-format
        nixd
        nixfmt-rfc-style
        ocrmypdf
        python312Packages.radian
        usbguard-notifier
        R-with-my-packages
      ];
  };

  # Allow unfree packages to install VSCode extensions
  nixpkgs.config.allowUnfree = true;
}
