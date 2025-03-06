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
        nix-channel --add https://nixos.org/channels/nixos-${nixos-version} nixpkgs

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
    home-manager = {
      enable = true;
    };
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
          codium-extensions.rdebugger.r-debugger
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
          vscode-extensions.jnoortheen.nix-ide
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
          "java.format.settings.url" = "~/.config/eclipse-style-guides/java.xml";
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

  # xdg options
  xdg.enable = true;

  # Allow unfree packages to install VSCode extensions
  nixpkgs.config.allowUnfree = true;
}
