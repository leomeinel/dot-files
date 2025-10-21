/*
  File: flake.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  # Description of the flake
  description = "home-manager configuration";

  # Input options
  inputs = {
    # nixpkgs
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    nixpkgs.url = "github:nixos/nixpkgs/nixos-REPLACE_NIX_VERSION"; # FIXME: This should be defined only once
    # home-manager
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home-manager = {
      url = "github:nix-community/home-manager/release-REPLACE_NIX_VERSION"; # FIXME: This should be defined only once
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix4vscode
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Output options
  outputs =
    {
      nixpkgs,
      home-manager,
      nix4vscode,
      ...
    }:
    let
      system = "x86_64-linux";
      # FIXME: This should be in common-home*.nix
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix4vscode.overlays.default ];
        config = {
          # Allow unfree packages to install VSCode extensions
          allowUnfree = true;
        };
      };
      installEnv = {
        SYSUSER = "REPLACE_SYSUSER";
        GUESTUSER = "REPLACE_GUESTUSER";
        HOMEUSER = "REPLACE_HOMEUSER";
        VIRTUSER = "REPLACE_VIRTUSER";
        WORKUSER = "REPLACE_WORKUSER";
        NIX_VERSION = "REPLACE_NIX_VERSION";
        GIT_EMAIL = "REPLACE_GIT_EMAIL";
        GIT_NAME = "REPLACE_GIT_NAME";
        GIT_SIGNINGKEY = "REPLACE_GIT_SIGNINGKEY";
        GIT_GPGSIGN = "REPLACE_GIT_GPGSIGN";
        BACKLIGHT_DEVICE = "REPLACE_BACKLIGHT_DEVICE";
        SWAY_AUTOSTART = ''
          REPLACE_SWAY_AUTOSTART
        '';
        SWAY_OUTPUT = ''
          REPLACE_SWAY_OUTPUT
        '';
        KEYLAYOUT = "REPLACE_KEYLAYOUT";
      };
    in
    {
      # Configurations
      homeConfigurations = {
        # Set this for non nixos
        targets.genericLinux.enable = true;
        # Users
        "root" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/ROOTUSER.nix ];
        };
        "${installEnv.SYSUSER}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nix4vscode installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/SYSUSER.nix ];
        };
        "${installEnv.GUESTUSER}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nix4vscode installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/GUESTUSER.nix ];
        };
        "${installEnv.HOMEUSER}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nix4vscode installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/HOMEUSER.nix ];
        };
        "${installEnv.VIRTUSER}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nix4vscode installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/VIRTUSER.nix ];
        };
        "${installEnv.WORKUSER}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nix4vscode installEnv; };
          # Modules to use
          modules = [ ./home-manager/configs/WORKUSER.nix ];
        };
      };
    };
}
