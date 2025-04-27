/*
  File = flake.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
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
    home-manager.url = "github:nix-community/home-manager/release-REPLACE_NIX_VERSION"; # FIXME: This should be defined only once
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix-vscode-extensions
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  # Output options
  outputs =
    {
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # FIXME: This should be defined only once
      nixos-version = "REPLACE_NIX_VERSION";
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
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/ROOTUSER.nix ];
        };
        "REPLACE_SYSUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version nix-vscode-extensions; };
          # Modules to use
          modules = [ ./home-manager/configs/SYSUSER.nix ];
        };
        "REPLACE_GUESTUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version nix-vscode-extensions; };
          # Modules to use
          modules = [ ./home-manager/configs/GUESTUSER.nix ];
        };
        "REPLACE_HOMEUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version nix-vscode-extensions; };
          # Modules to use
          modules = [ ./home-manager/configs/HOMEUSER.nix ];
        };
        "REPLACE_VIRTUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version nix-vscode-extensions; };
          # Modules to use
          modules = [ ./home-manager/configs/VIRTUSER.nix ];
        };
        "REPLACE_WORKUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version nix-vscode-extensions; };
          # Modules to use
          modules = [ ./home-manager/configs/WORKUSER.nix ];
        };
      };
    };
}
