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
  lib,
  config,
  pkgs,
  nixos-version,
  ...
}:

{
  # Imports
  imports = [ ];

  # Nixpkgs options
  nixpkgs = {
    overlays = [ ];
    config = { };
  };

  # Home options
  home = {
    # State version
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "${nixos-version}";
    # Packages
    packages = with pkgs; [
      cmake-format
      nixd
      nixfmt-rfc-style
      ocrmypdf
      python312Packages.radian
      usbguard-notifier
      xdg-ninja
    ];
    # Enable management of XDG base directories
    xdg.enable = true;
    # Files in $HOME
    file = {
      "${config.xdg.configHome}" = {
        source = ../files/.config;
        recursive = true;
      };
      "${config.xdg.dataHome}" = {
        source = ../files/.local/share;
        recursive = true;
      };
      ".local/bin" = {
        source = ../files/.local/bin;
        recursive = true;
      };
      ".bash_aliases" = {
        source = ../files/.bash_aliases;
        recursive = true;
      };
      ".bash_logout" = {
        source = ../files/.bash_logout;
        recursive = true;
      };
      ".bash_profile" = {
        source = ../files/.bash_profile;
        recursive = true;
      };
      ".bashrc" = {
        source = ../files/.bashrc;
        recursive = true;
      };
    };
    # Activation script
    activation = {
      common-home = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Define functions
        sed_exit() {
            echo "ERROR: 'sed' didn't replace, report this @"
            echo "       https://github.com/leomeinel/dot-files/issues"
            exit 1
        }

        # Create dirs
        mkdir -p ~/Documents/Pictures/Screenshots
        mkdir -p ~/.local/bin/
        mkdir -p ~/.ssh
        chmod 700 ~/.ssh
        mkdir -p ~/src
        chmod 700 ~/src

        # Create XDG dirs
        mkdir -p "$HOME"/.cache
        mkdir -p "$HOME"/.config
        mkdir -p "$HOME"/.local/share
        mkdir -p "$HOME"/.local/state
        mkdir -p "$XDG_CONFIG_HOME"/java
        mkdir -p "$XDG_DATA_HOME"/android
        mkdir -p "$XDG_DATA_HOME"/cargo
        mkdir -p "$XDG_DATA_HOME"/gnupg
        chmod 700 "$XDG_DATA_HOME"/gnupg
        mkdir -p "$XDG_DATA_HOME"/go
        mkdir -p "$XDG_DATA_HOME"/gradle
        mkdir -p "$XDG_CONFIG_HOME"/gtk-2.0
        mkdir -p "$XDG_STATE_HOME"/bash
        mkdir -p "$XDG_CONFIG_HOME"/parallel
        mkdir -p "$XDG_DATA_HOME"/platformio
        mkdir -p "$XDG_CONFIG_HOME"/r
        mkdir -p "$XDG_DATA_HOME"/r/library
        mkdir -p "$XDG_STATE_HOME"/r
        mkdir -p "$XDG_DATA_HOME"/rustup
        mkdir -p "$XDG_CONFIG_HOME"/screen
        mkdir -p "$XDG_CACHE_HOME"/texlive

        # Chmod ~/.local/bin/*.sh
        chmod +x ~/.local/bin/*.sh

        # Set keyboard layout for sway
        LAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
        ## START sed
        FILE=~/.config/sway/config.d/input
        ##
        [[ -f "$FILE" ]] && [[ -n "$LAYOUT" ]] &&
            {
                ##
                STRING="^    xkb_layout .*"
                grep -q "$STRING" "$FILE" || sed_exit
                sed -i "s/$STRING/    xkb_layout $LAYOUT/" "$FILE"
                ## END sed
            }

        # Set default rust if rustup is installed
        [[ -n $(which rustup) ]] >/dev/null 2>&1 &&
            rustup default stable

        # Initialize nvim
        nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1

        # Add nix channel
        nix-channel --add https://nixos.org/channels/nixos-REPLACE_NIX_VERSION nixpkgs

        # Install R packages
        if [[ -n $(which R) ]] >/dev/null 2>&1; then
            R -e 'install.packages(c("devtools", "lintr", "httpgd", "languageserver", "rmarkdown"))' >/dev/null 2>&1
            R -e 'install.packages("vscDebugger", repos = "https://manuelhentschel.r-universe.dev")' >/dev/null 2>&1
        else
            rm -f ~/.local/bin/update-packages-r.sh
        fi
      '';
    };
  };

  # Program options
  programs = {
    home-manager.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles = {
        default = {
          extensions = with pkgs.vscode-extensions; [
            anseki.vscode-color
            christian-kohler.path-intellisense
            dotjoshjohnson.xml
            esbenp.prettier-vscode
            fill-labs.dependi
            formulahendry.auto-complete-tag
            formulahendry.code-runner
            franneck94.vscode-c-cpp-dev-extension-pack
            franneck94.vscode-python-dev-extension-pack
            franneck94.workspace-formatter
            fwcd.kotlin
            gitlab.gitlab-workflow
            golang.go
            gruntfuggly.activitusbar
            hangxingliu.vscode-nginx-conf-hint
            htmlhint.vscode-htmlhint
            jnoortheen.nix-ide
            jock.svg
            kisstkondoros.vscode-gutter-preview
            kokororin.vscode-phpfmt
            mikestead.dotenv
            mkhl.shfmt
            ms-vscode.live-server
            mtxr.sqltools
            mtxr.sqltools-driver-mssql
            mtxr.sqltools-driver-mysql
            mtxr.sqltools-driver-pg
            mtxr.sqltools-driver-sqlite
            naumovs.color-highlight
            pkief.material-icon-theme
            pkief.material-product-icons
            pranaygp.vscode-css-peek
            psioniq.psi-header
            rdebugger.r-debugger
            rebornix.ruby
            redhat.vscode-xml
            redhat.vscode-yaml
            reditorsupport.r
            rust-lang.rust-analyzer
            swellaby.vscode-rust-test-adapter
            tamasfe.even-better-toml
            usernamehw.errorlens
            vscjava.vscode-java-pack
            waderyan.gitblame
            wingrunr21.vscode-ruby
            yzane.markdown-pdf
            yzhang.markdown-all-in-one
            zhuangtongfa.material-theme
            zignd.html-css-class-completion
          ];
        };
      };
    };
  };
}
