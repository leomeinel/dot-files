/*
  File = programs-gui.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  config,
  pkgs,
  ...
}:

{
  # Programs options
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.open-vsx; [
        13xforever.language-x86-64-assembly
        bbenoist.doxygen
        bierner.color-info
        charliermarsh.ruff
        cheshirekow.cmake-format
        christian-kohler.path-intellisense
        cschlosser.doxdocgen
        dotjoshjohnson.xml
        editorconfig.editorconfig
        esbenp.prettier-vscode
        fill-labs.dependi
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        formulahendry.code-runner
        franneck94.c-cpp-runner
        franneck94.vscode-c-cpp-config
        franneck94.vscode-c-cpp-dev-extension-pack
        franneck94.vscode-python-config
        franneck94.vscode-python-dev-extension-pack
        franneck94.workspace-formatter
        fwcd.kotlin
        gitlab.gitlab-workflow
        golang.go
        gruntfuggly.activitusbar
        hangxingliu.vscode-nginx-conf-hint
        hbenl.vscode-test-explorer
        htmlhint.vscode-htmlhint
        jeff-hykin.better-cpp-syntax
        jnoortheen.nix-ide
        jock.svg
        kisstkondoros.vscode-gutter-preview
        kokororin.vscode-phpfmt
        llvm-vs-code-extensions.vscode-clangd
        mikestead.dotenv
        mkhl.shfmt
        ms-python.black-formatter
        ms-python.isort
        ms-python.mypy-type-checker
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode.cmake-tools
        ms-vscode.cpptools-themes
        ms-vscode.live-server
        ms-vscode.test-adapter-converter
        mtxr.sqltools
        mtxr.sqltools-driver-mssql
        mtxr.sqltools-driver-mysql
        mtxr.sqltools-driver-pg
        mtxr.sqltools-driver-sqlite
        naumovs.color-highlight
        njpwerner.autodocstring
        njqdev.vscode-python-typehint
        pkief.material-icon-theme
        pkief.material-product-icons
        pranaygp.vscode-css-peek
        psioniq.psi-header
        rebornix.ruby
        redhat.java
        redhat.vscode-xml
        redhat.vscode-yaml
        reditorsupport.r
        rust-lang.rust-analyzer
        swellaby.vscode-rust-test-adapter
        tamasfe.even-better-toml
        timonwong.shellcheck
        twxs.cmake
        usernamehw.errorlens
        vadimcn.vscode-lldb
        vscjava.vscode-gradle
        vscjava.vscode-java-debug
        vscjava.vscode-java-dependency
        vscjava.vscode-java-pack
        vscjava.vscode-java-test
        vscjava.vscode-maven
        waderyan.gitblame
        wingrunr21.vscode-ruby
        yzane.markdown-pdf
        yzhang.markdown-all-in-one
        zhuangtongfa.material-theme
        zignd.html-css-class-completion
      ];
      userSettings = with pkgs; {
        "activitusbar.activeColour" = "statusBar.foreground";
        "activitusbar.inactiveColour" = "statusBar.foreground";
        "code-runner.enableAppInsights" = false;
        "prettier.prettierPath" = "${config.home.profileDirectory}/lib/node_modules/prettier/";
        "prettier.trailingComma" = "none";
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
        "git.defaultCloneDirectory" = "${config.home.homeDirectory}/src";
        "git.detectSubmodules" = false;
        "git.detectSubmodulesLimit" = 100;
        "git.enableCommitSigning" = true;
        "git.enableSmartCommit" = true;
        "git.enableStatusBarSync" = false;
        "git.fetchOnPull" = true;
        "git.ignoreSubmodules" = true;
        "git.scanRepositories" = [ "${config.home.homeDirectory}/src" ];
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
        "python.languageServer" = "Jedi";
        "oneDarkPro.editorTheme" = "One Dark Pro Darker";
        "phpfmt.indent_with_space" = 4;
        "r.libPaths" = [
          "${rPackages.languageserver}/library"
          "${rPackages.jsonlite}/library"
          "${rPackages.httpgd}/library"
        ];
        "r.plot.useHttpgd" = true;
        "r.rpath.linux" = "${rWrapper}/bin/R";
        "redhat.telemetry.enabled" = false;
        "rust-analyzer.check.command" = "${rustup}/bin/cargo-clippy";
        "rust-analyzer.checkOnSave" = true;
        "rust-analyzer.debug.engine" = "vadimcn.vscode-lldb";
        "scm.repositories.sortOrder" = "name";
        "search.showLineNumbers" = true;
        "search.smartCase" = true;
        "search.useIgnoreFiles" = false;
        "shellcheck.executablePath" = "${shellcheck}/bin/shellcheck";
        "telemetry.telemetryLevel" = "off";
        "terminal.external.linuxExec" = "/usr/bin/alacritty";
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
        "window.autoDetectColorScheme" = false;
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
            "language" = "nix";
            "begin" = "/*";
            "prefix" = "  ";
            "end" = "*/";
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
              "File: <<fileName>>"
              "Author: <<author>> (<<author_email>>)"
              "-----"
              "Copyright (c) <<year>> <<author>> & contributors"
              "SPDX ID: <<spdxid>>"
              "URL: <<licenseurl>>"
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
}
