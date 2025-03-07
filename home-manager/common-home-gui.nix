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
        xdg-ninja
        R-with-my-packages
      ];
    # Files in $HOME
    file = {
      "${config.xdg.configHome}" = {
        source = ../files/.config;
        recursive = true;
      };
    };
    sessionVariables = {
      JAVA_HOME = "/usr/lib/jvm/default";
      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";
      MYSQL_HOME = "/var/lib/mysql";
      PAGER = "/usr/bin/less";
      MANPAGER = "/usr/bin/sh -c '/usr/bin/col -bx | /usr/bin/bat -l man -p'";
      MANROFFOPT = "-c";
      ANDROID_HOME = "${config.xdg.dataHome}/android";
      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      GOPATH = "${config.xdg.dataHome}/go";
      GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
      HISTFILE = "${config.xdg.stateHome}/bash/history";
      PARALLEL_HOME = "${config.xdg.configHome}/parallel";
      PLATFORMIO_CORE_DIR = "${config.xdg.dataHome}/platformio";
      R_ENVIRON_USER = "${config.xdg.configHome}/r/.Renviron";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      SCREENRC = "${config.xdg.configHome}/screen/screenrc";
      TEXMFVAR = "${config.xdg.cacheHome}/texlive/texmf-var";
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
        mkdir -p ~/.ssh
        chmod 700 ~/.ssh
        mkdir -p ~/src
        chmod 700 ~/src

        # Create XDG dirs
        mkdir -p ${config.xdg.cacheHome}
        mkdir -p ${config.xdg.configHome}
        mkdir -p ${config.xdg.dataHome}
        mkdir -p ${config.xdg.stateHome}
        mkdir -p ${config.xdg.configHome}/java
        mkdir -p ${config.xdg.dataHome}/android
        mkdir -p ${config.xdg.dataHome}/cargo
        mkdir -p ${config.xdg.dataHome}/go
        mkdir -p ${config.xdg.dataHome}/gradle
        mkdir -p ${config.xdg.configHome}/gtk-2.0
        mkdir -p ${config.xdg.stateHome}/bash
        mkdir -p ${config.xdg.configHome}/parallel
        mkdir -p ${config.xdg.dataHome}/platformio
        mkdir -p ${config.xdg.configHome}/r
        mkdir -p ${config.xdg.dataHome}/r/library
        mkdir -p ${config.xdg.stateHome}/r
        mkdir -p ${config.xdg.dataHome}/rustup
        mkdir -p ${config.xdg.configHome}/screen
        mkdir -p ${config.xdg.cacheHome}/texlive

        # Set keyboard layout for sway
        # FIXME: localectl, awk unknown command
        #LAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
        ### START sed
        #FILE=${config.xdg.configHome}/sway/config.d/input
        ###
        #[[ -f "$FILE" ]] && [[ -n "$LAYOUT" ]] &&
        #    {
        #        ##
        #        STRING="^    xkb_layout .*"
        #        grep -q "$STRING" "$FILE" || sed_exit
        #        sed -i "s/$STRING/    xkb_layout $LAYOUT/" "$FILE"
        #        ## END sed
        #    }

        # Set default rust if rustup is installed
        [[ -n $(which rustup) ]] >/dev/null 2>&1 &&
            rustup default stable

        # Initialize nvim
        nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1
      '';
    };
  };

  # Program options
  programs = {
    # Select programs
    starship.enable = true;
    home-manager.enable = true;
    # Bash options
    bash = {
      enable = true;
      enableCompletion = true;
      # Equivalent to .bashrc for interactive sessions
      bashrcExtra = ''
        # Commands that should be applied only for interactive shells.
        [[ $- == *i* ]] || return

        # Key bindings
        bind '"\e[A": history-search-backward'
        bind '"\e[B": history-search-forward'

        # History
        HISTCONTROL=ignoredups:ignorespace
        HISTSIZE=1000
        HISTFILESIZE=10000
        shopt -s histappend

        # Line wrap on window resize
        shopt -s checkwinsize

        # Tab completion for doas
        complete -cf /usr/bin/doas

        # If GUI isn't available and not connected through ssh, don't do anything
        [[ -z "$XDG_CURRENT_DESKTOP" ]] && [[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]] &&
            return

        # List number of outdated packages
        UPDATES="$(/usr/bin/timeout 4 /usr/bin/checkupdates 2> /dev/null | /usr/bin/wc -l)"
        [[ "$UPDATES" -gt 0 ]] &&
            /usr/bin/echo -e "\e[31m$UPDATES\e[0m packages are out of date!"
      '';
      # Aliases
      shellAliases = {
        # doas
        doas = "/usr/bin/doas ";
        sudo = "/usr/bin/sudo ";

        # btrfs
        df = "/usr/bin/btrfs fi df";

        # Rust core-utils aliases
        ls = "/usr/bin/eza -la --color=automatic";
        cat = "/usr/bin/bat --decorations auto --color auto";
        grep = "/usr/bin/rg -s --color auto";
        find = "/usr/bin/fd -Hs -c auto";
        du = "/usr/bin/dust";
        ps = "/usr/bin/procs";
        neofetch = "/usr/bin/macchina";
        bench = "/usr/bin/hyperfine -w 3 -r 12 --style auto";

        # xdg-ninja recommendations
        adb = "HOME = ${config.xdg.dataHome}/android adb";
        wget = "wget --hsts-file=${config.xdg.dataHome}/wget-hsts";
      };
      # Equivalent to .bash_profile
      profileExtra = ''
        # Commands that should be applied only for interactive shells.
        [[ $- == *i* ]] || return

        # Start ssh-agent if it is not already started
        [[ -z "$SSH_AUTH_SOCK" ]] &&
            eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

        # Update rust toolchains if rustup is installed
        [[ -n $(/usr/bin/which rustup) ]] >/dev/null 2>&1 &&
            /usr/bin/rustup update >/dev/null 2>&1

        # If sway is not installed, don't do anything
        [[ -z $(/usr/bin/which sway) ]] >/dev/null 2>&1 &&
            return

        # If current user is root, don't do anything
        [[ "$UID" -eq 0 ]] &&
            return

        # Start sway with environment variables
        if [[ -z "''${WAYLAND_DISPLAY}" ]] && [[ "''${XDG_VTNR}" -eq 1 ]]; then
            export MOZ_ENABLE_WAYLAND=1
            export MOZ_WEBRENDER=1
            export GTK_THEME="Arc-Dark"
            export QT_AUTO_SCREEN_SCALE_FACTOR=1
            export QT_QPA_PLATFORM="wayland;xcb"
            export QT_QPA_PLATFORMTHEME=qt6ct
            export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
            export WLR_NO_HARDWARE_CURSORS=1
            export WLR_RENDERER_ALLOW_SOFTWARE=1
            export XCURSOR_SIZE=24
            export XDG_CURRENT_DESKTOP=sway
            export XDG_SESSION_DESKTOP=sway
            export XDG_SESSION_TYPE=wayland
            export TERMINAL=${pkgs.alacritty}/bin/alacritty
            exec /usr/bin/sway
        fi
      '';
      # Equivalent to .bash_logout
      logoutExtra = ''
        # Stop ssh-agent if it is started
        [[ -n "$SSH_AUTH_SOCK" ]] &&
            eval "$(/usr/bin/ssh-agent -k)"

        # Clear screen
        [[ "$SHLVL" = 1 ]] &&
            /usr/bin/clear
      '';
    };
    # git options and config (.config/git/config)
    git = {
      enable = true;
      userEmail = "leo@meinel.dev";
      userName = "Leopold Johannes Meinel";
      signing.signByDefault = true;
      signing.key = "REPLACE_GIT_SIGNING_KEY";
      # git delta
      delta = {
        enable = true;
        options = {
          decorations = {
            commit-decoration-style = "blue ol";
            commit-style = "raw";
            file-style = "omit";
            hunk-header-decoration-style = "blue box";
            hunk-header-file-style = "red";
            hunk-header-line-number-style = "#067a00";
            hunk-header-style = "file line-number syntax";
          };
          interactive.keep-plus-minus-markers = false;
          navigate = true;
          light = false;
          features = "decorations";
        };
      };
      # custom config
      extraConfig = {
        core = {
          editor = "nvim";
          autocrlf = "input";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        add.interactive.useBuiltin = false;
        credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      };
    };
    # Gpg options
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
    # Neovim options
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    alacritty = {
      enable = true;
      settings = {
        general = {
          import = [ "/usr/share/gruvbox/gruvbox.toml" ];
          live_config_reload = true;
        };

        window = {
          padding = {
            x = 0;
            y = 0;
          };
          decorations = "none";
          decorations_theme_variant = "None";
          opacity = 1.0;
          startup_mode = "Maximized";
          title = "Alacritty";
          dynamic_title = false;
          class = {
            instance = "Alacritty";
            general = "Alacritty";
          };
        };

        scolling = {
          history = 10000;
          multiplier = 3;
        };

        mouse.hide_when_typing = true;

        font = {
          size = 10;
          normal = {
            family = "Noto Sans Mono";
            style = "Regular";
          };
          bold = {
            family = "Noto Sans Mono";
            style = "Bold";
          };
          italic = {
            family = "Noto Sans Mono";
            style = "Italic";
          };
          bold_italic = {
            family = "Noto Sans Mono";
            style = "Bold Italic";
          };
        };

        env.TERM = "alacritty";
      };
    };
    # Vscode options
    vscode =
      let
        codium-extensions = (import ./codium-extensions/codium-extensions.nix) {
          pkgs = pkgs;
          lib = lib;
        };
      in
      with pkgs;
      {
        enable = true;
        package = vscodium;
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;
        extensions = [
          # Marketplace
          codium-extensions.bierner.color-info
          codium-extensions.franneck94.vscode-c-cpp-dev-extension-pack
          codium-extensions."13xforever".language-x86-64-assembly
          codium-extensions.bbenoist.doxygen
          codium-extensions.cheshirekow.cmake-format
          codium-extensions.cschlosser.doxdocgen
          codium-extensions.franneck94.c-cpp-runner
          codium-extensions.franneck94.vscode-c-cpp-config
          codium-extensions.jeff-hykin.better-cpp-syntax
          codium-extensions.ms-vscode.cpptools-themes
          codium-extensions.franneck94.vscode-python-config
          codium-extensions.franneck94.vscode-python-dev-extension-pack
          codium-extensions.ms-python.mypy-type-checker
          codium-extensions.njqdev.vscode-python-typehint
          codium-extensions.franneck94.workspace-formatter
          codium-extensions.fwcd.kotlin
          codium-extensions.gruntfuggly.activitusbar
          codium-extensions.hangxingliu.vscode-nginx-conf-hint
          codium-extensions.htmlhint.vscode-htmlhint
          # FIXME: jnoortheen.nix-ide should be in vscode-extensions, but the version in pkgs isn't compatible with the pkgs version of the extension in pkgs
          codium-extensions.jnoortheen.nix-ide
          codium-extensions.kisstkondoros.vscode-gutter-preview
          codium-extensions.kokororin.vscode-phpfmt
          codium-extensions.mkhl.shfmt
          codium-extensions.mtxr.sqltools
          codium-extensions.mtxr.sqltools-driver-mssql
          codium-extensions.mtxr.sqltools-driver-mysql
          codium-extensions.mtxr.sqltools-driver-pg
          codium-extensions.mtxr.sqltools-driver-sqlite
          codium-extensions.pranaygp.vscode-css-peek
          codium-extensions.psioniq.psi-header
          codium-extensions.swellaby.vscode-rust-test-adapter
          codium-extensions.zignd.html-css-class-completion
          # Nix
          vscode-extensions.christian-kohler.path-intellisense
          vscode-extensions.dotjoshjohnson.xml
          vscode-extensions.editorconfig.editorconfig
          vscode-extensions.esbenp.prettier-vscode
          vscode-extensions.fill-labs.dependi
          vscode-extensions.formulahendry.auto-close-tag
          vscode-extensions.formulahendry.auto-rename-tag
          vscode-extensions.formulahendry.code-runner
          vscode-extensions.gitlab.gitlab-workflow
          vscode-extensions.golang.go
          vscode-extensions.hbenl.vscode-test-explorer
          # FIXME: jnoortheen.nix-ide should be in vscode-extensions, but the version in pkgs isn't compatible with the pkgs version of the extension in pkgs
          #vscode-extensions.jnoortheen.nix-ide
          vscode-extensions.jock.svg
          vscode-extensions.mikestead.dotenv
          vscode-extensions.ms-vscode.live-server
          vscode-extensions.ms-vscode.test-adapter-converter
          vscode-extensions.naumovs.color-highlight
          vscode-extensions.pkief.material-icon-theme
          vscode-extensions.pkief.material-product-icons
          vscode-extensions.rebornix.ruby
          vscode-extensions.redhat.vscode-xml
          vscode-extensions.redhat.vscode-yaml
          vscode-extensions.reditorsupport.r
          vscode-extensions.rust-lang.rust-analyzer
          vscode-extensions.tamasfe.even-better-toml
          vscode-extensions.usernamehw.errorlens
          vscode-extensions.vscjava.vscode-java-pack
          vscode-extensions.redhat.java
          vscode-extensions.vscjava.vscode-gradle
          vscode-extensions.vscjava.vscode-java-debug
          vscode-extensions.vscjava.vscode-java-dependency
          vscode-extensions.vscjava.vscode-java-test
          vscode-extensions.vscjava.vscode-maven
          vscode-extensions.waderyan.gitblame
          vscode-extensions.wingrunr21.vscode-ruby
          vscode-extensions.yzane.markdown-pdf
          vscode-extensions.yzhang.markdown-all-in-one
          vscode-extensions.zhuangtongfa.material-theme
          vscode-extensions.ms-vscode.cpptools-extension-pack
          vscode-extensions.ms-vscode.cmake-tools
          vscode-extensions.ms-vscode.cpptools
          vscode-extensions.twxs.cmake
          vscode-extensions.vadimcn.vscode-lldb
          vscode-extensions.charliermarsh.ruff
          vscode-extensions.ms-python.black-formatter
          vscode-extensions.ms-python.isort
          vscode-extensions.ms-python.python
          vscode-extensions.ms-python.vscode-pylance
          vscode-extensions.ms-toolsai.jupyter
          vscode-extensions.ms-toolsai.jupyter-keymap
          vscode-extensions.ms-toolsai.jupyter-renderers
          vscode-extensions.ms-toolsai.vscode-jupyter-cell-tags
          vscode-extensions.ms-toolsai.vscode-jupyter-slideshow
          vscode-extensions.njpwerner.autodocstring
        ];
        userSettings = {
          "activitusbar.activeColour" = "statusBar.foreground";
          "activitusbar.inactiveColour" = "statusBar.foreground";
          "code-runner.enableAppInsights" = false;
          "prettier.prettierPath" = "/usr/lib/node_modules/prettier/";
          "debug.showInStatusBar" = "never";
          "editor.detectIndentation" = false;
          "editor.foldingImportsByDefault" = true;
          "editor.foldingMaximumRegions" = 50000;
          "editor.formatOnSave" = true;
          "editor.guides.bracketPairs" = "active";
          "editor.guides.highlightActiveBracketPair" = false;
          "editor.multiCursorModifier" = "ctrlCmd";
          "editor.scrollbar.horizontalScrollbarSize" = 10;
          "editor.scrollbar.verticalScrollbarSize" = 10;
          "editor.scrollBeyondLastLine" = false;
          "editor.tabCompletion" = "on";
          "editor.unfoldOnClickAfterEndOfLine" = true;
          "evenBetterToml.formatter.indentString" = " ";
          "explorer.confirmDelete" = false;
          "files.autoSave" = "afterDelay";
          "git.autofetch" = "all";
          "git.autoRepositoryDetection" = "openEditors";
          "git.autoStash" = true;
          "git.confirmSync" = false;
          "git.defaultCloneDirectory" = "~/src";
          "git.detectSubmodules" = false;
          "git.detectSubmodulesLimit" = 100;
          "git.enableCommitSigning" = true;
          "git.enableSmartCommit" = true;
          "git.enableStatusBarSync" = false;
          "git.fetchOnPull" = true;
          "git.ignoreSubmodules" = true;
          "git.scanRepositories" = [ "~/src" ];
          "gitblame.statusBarMessageFormat" = "\${author.name} (\${time.ago})";
          "github.gitProtocol" = "ssh";
          "java.eclipse.downloadSources" = true;
          "java.format.settings.url" = "${config.xdg.configHome}/eclipse-style-guides/java.xml";
          "markdown-pdf.displayHeaderFooter" = false;
          "markdown-pdf.omitBackground" = true;
          "markdown-pdf.outputDirectory" = "markdown-pdf";
          "markdown-pdf.outputDirectoryRelativePathFile" = true;
          "markdown.extension.toc.orderedList" = true;
          "material-icon-theme.hidesExplorerArrows" = true;
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "oneDarkPro.editorTheme" = "One Dark Pro Darker";
          "phpfmt.indent_with_space" = 4;
          "redhat.telemetry.enabled" = false;
          "rust-analyzer.check.command" = "clippy";
          "rust-analyzer.checkOnSave" = true;
          "rust-analyzer.debug.engine" = "vadimcn.vscode-lldb";
          "scm.repositories.sortOrder" = "name";
          "search.showLineNumbers" = true;
          "search.smartCase" = true;
          "search.useIgnoreFiles" = false;
          "telemetry.telemetryLevel" = "off";
          "terminal.external.linuxExec" = "alacritty";
          "terminal.integrated.defaultProfile.linux" = "bash";
          "terminal.integrated.ignoreProcessNames" = [
            "starship"
            "bash"
          ];
          "terminal.integrated.localEchoExcludePrograms" = [ "nvim" ];
          "terminal.integrated.shellIntegration.history" = 500;
          "terminal.integrated.useWslProfiles" = false;
          "terminal.integrated.windowsEnableConpty" = false;
          "update.mode" = "none";
          "update.showReleaseNotes" = false;
          "window.autoDetectColorScheme" = true;
          "workbench.activityBar.location" = "hidden";
          "workbench.colorTheme" = "One Dark Pro Darker";
          "workbench.commandPalette.history" = 500;
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.preferredDarkColorTheme" = "One Dark Pro Darker";
          "workbench.productIconTheme" = "material-product-icons";
          "workbench.startupEditor" = "none";
          "zenMode.centerLayout" = false;
          "zenMode.hideLineNumbers" = false;
          "zenMode.hideStatusBar" = false;
          "zenMode.showTabs" = "multiple";
          "psi-header.config" = {
            "forceToTop" = true;
            "blankLinesAfter" = 1;
            "license" = "MIT";
          };
          "psi-header.variables" = [
            [
              "author"
              "Leopold Meinel"
            ]
            [
              "author_email"
              "leo@meinel.dev"
            ]
          ];
          "psi-header.changes-tracking" = {
            "isActive" = true;
            "exclude" = [
              "abap"
              "bbcode"
              "bibtex"
              "clojure"
              "coffeescript"
              "conf"
              "config"
              "diff"
              "git-commit"
              "git-rebase"
              "groovy"
              "handlebars"
              "ini"
              "json"
              "jsonc"
              "latex"
              "makefile"
              "markdown"
              "plaintext"
              "tex"
              "xml"
              "xsl"
              "yaml"
            ];
            "autoHeader" = "autoSave";
            "enforceHeader" = false;
            "replace" = [
              "File:"
              "Author:"
              "Copyright (c)"
            ];
            "updateLicenseVariables" = false;
          };
          "psi-header.lang-config" = [
            {
              "language" = "bat";
              "begin" = "";
              "prefix" = "@rem ";
              "end" = "";
            }
            {
              "language" = "c";
              "begin" = "/*";
              "prefix" = " * ";
              "end" = " */";
            }
            {
              "language" = "dockerfile";
              "begin" = "###";
              "prefix" = "# ";
              "end" = "###";
            }
            {
              "language" = "fsharp";
              "begin" = "(*";
              "prefix" = " * ";
              "end" = " *)";
            }
            {
              "language" = "haml";
              "begin" = "<!--";
              "prefix" = "--";
              "end" = " -->";
            }
            {
              "language" = "lua";
              "begin" = "--[[";
              "prefix" = "--";
              "end" = "--]]";
            }
            {
              "language" = "jade";
              "begin" = "";
              "prefix" = "//";
              "end" = "";
            }
            {
              "language" = "powershell";
              "begin" = "###";
              "prefix" = "# ";
              "end" = "###";
              "beforeHeader" = [ "#!/usr/bin/env pwsh" ];
            }
            {
              "language" = "python";
              "begin" = "###";
              "prefix" = "# ";
              "end" = "###";
              "beforeHeader" = [ "#!/usr/bin/env python3" ];
            }
            {
              "language" = "razor";
              "begin" = "@*";
              "prefix" = " * ";
              "end" = " *@";
            }
            {
              "language" = "shellscript";
              "begin" = "###";
              "prefix" = "# ";
              "end" = "###";
              "beforeHeader" = [ "#!/usr/bin/env bash" ];
            }
            {
              "language" = "slim";
              "begin" = "";
              "prefix" = "/!";
              "end" = "";
            }
            {
              "language" = "vb";
              "begin" = "'''";
              "prefix" = "'";
              "end" = "'''";
            }
            {
              "language" = "cpp";
              "mapTo" = "c";
            }
            {
              "language" = "csharp";
              "mapTo" = "c";
            }
            {
              "language" = "cuda-cpp";
              "mapTo" = "c";
            }
            {
              "language" = "css";
              "mapTo" = "c";
            }
            {
              "language" = "go";
              "mapTo" = "c";
            }
            {
              "language" = "java";
              "mapTo" = "c";
            }
            {
              "language" = "javascript";
              "mapTo" = "c";
            }
            {
              "language" = "javascriptreact";
              "mapTo" = "c";
            }
            {
              "language" = "less";
              "mapTo" = "c";
            }
            {
              "language" = "objective-c";
              "mapTo" = "c";
            }
            {
              "language" = "objective-cpp";
              "mapTo" = "c";
            }
            {
              "language" = "php";
              "mapTo" = "c";
            }
            {
              "language" = "rust";
              "mapTo" = "c";
            }
            {
              "language" = "sql";
              "mapTo" = "c";
            }
            {
              "language" = "stylus";
              "mapTo" = "c";
            }
            {
              "language" = "swift";
              "mapTo" = "c";
            }
            {
              "language" = "typescript";
              "mapTo" = "c";
            }
            {
              "language" = "typescriptreact";
              "mapTo" = "c";
            }
            {
              "language" = "perl";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "perl6";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "r";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "ruby";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "scss";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "toml";
              "mapTo" = "dockerfile";
            }
            {
              "language" = "html";
              "mapTo" = "haml";
            }
            {
              "language" = "vue";
              "mapTo" = "haml";
            }
            {
              "language" = "vue-html";
              "mapTo" = "haml";
            }
            {
              "language" = "pug";
              "mapTo" = "jade";
            }
            {
              "language" = "sass";
              "mapTo" = "jade";
            }
            {
              "language" = "shaderlab";
              "mapTo" = "jade";
            }
          ];
          "psi-header.templates" = [
            {
              "language" = "*";
              "template" = [
                "File = <<fileName>>"
                "Author = <<author>> (<<author_email>>)"
                "-----"
                "Copyright (c) <<year>> <<author>> & contributors"
                "SPDX ID = <<spdxid>>"
                "URL = <<licenseurl>>"
                "-----"
              ];
            }
          ];
          "[java]" = {
            "editor.defaultFormatter" = "redhat.java";
          };
          "[rust]" = {
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          };
          "[markdown]" = {
            "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
          };
          "[css]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[sql]" = {
            "editor.defaultFormatter" = "mtxr.sqltools";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[jsonc]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[yaml]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[xml]" = {
            "editor.defaultFormatter" = "DotJoshJohnson.xml";
          };
        };
      };
  };

  # Services
  services = {
    # Gpg-agent options
    gpg-agent = with pkgs; {
      enable = true;
      pinentryPackage = pinentry-gnome3;
    };
  };

  # xdg options
  xdg.enable = true;

  # Allow unfree packages to install VSCode extensions
  nixpkgs.config.allowUnfree = true;

  # Nix options
  # FIXME: Either remove this if unsupported or readd with correct syntax; nixpkgs is unknown, pkgs isn't correct
  #nix.channels = { inherit nixpkgs; };

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
