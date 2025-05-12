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
    vscode = with pkgs; {
      enable = true;
      package = vscodium;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = [
        open-vsx."13xforever".language-x86-64-assembly
        open-vsx.bbenoist.doxygen
        open-vsx.bierner.color-info
        open-vsx.charliermarsh.ruff
        open-vsx.cheshirekow.cmake-format
        open-vsx.christian-kohler.path-intellisense
        open-vsx.cschlosser.doxdocgen
        open-vsx.dbaeumer.vscode-eslint
        open-vsx.dotjoshjohnson.xml
        open-vsx.editorconfig.editorconfig
        open-vsx.esbenp.prettier-vscode
        open-vsx.fill-labs.dependi
        open-vsx.formulahendry.auto-close-tag
        open-vsx.formulahendry.auto-rename-tag
        open-vsx.formulahendry.code-runner
        open-vsx.franneck94.c-cpp-runner
        open-vsx.franneck94.vscode-c-cpp-config
        open-vsx.franneck94.vscode-c-cpp-dev-extension-pack
        open-vsx.franneck94.vscode-python-config
        open-vsx.franneck94.vscode-python-dev-extension-pack
        open-vsx.franneck94.workspace-formatter
        open-vsx.fwcd.kotlin
        open-vsx.gitlab.gitlab-workflow
        open-vsx.golang.go
        open-vsx.gruntfuggly.activitusbar
        open-vsx.hangxingliu.vscode-nginx-conf-hint
        open-vsx.hbenl.vscode-test-explorer
        open-vsx.htmlhint.vscode-htmlhint
        open-vsx.jeff-hykin.better-cpp-syntax
        open-vsx.jnoortheen.nix-ide
        open-vsx.jock.svg
        open-vsx.kisstkondoros.vscode-gutter-preview
        open-vsx.kokororin.vscode-phpfmt
        open-vsx.llvm-vs-code-extensions.vscode-clangd
        open-vsx.mikestead.dotenv
        open-vsx.mkhl.shfmt
        open-vsx.ms-python.black-formatter
        open-vsx.ms-python.isort
        open-vsx.ms-python.mypy-type-checker
        open-vsx.ms-python.python
        open-vsx.ms-toolsai.jupyter
        open-vsx.ms-toolsai.jupyter-keymap
        open-vsx.ms-toolsai.jupyter-renderers
        open-vsx.ms-toolsai.vscode-jupyter-cell-tags
        open-vsx.ms-toolsai.vscode-jupyter-slideshow
        open-vsx.ms-vscode.cmake-tools
        open-vsx.ms-vscode.cpptools-themes
        open-vsx.ms-vscode.live-server
        open-vsx.ms-vscode.test-adapter-converter
        open-vsx.mtxr.sqltools
        open-vsx.mtxr.sqltools-driver-mssql
        open-vsx.mtxr.sqltools-driver-mysql
        open-vsx.mtxr.sqltools-driver-pg
        open-vsx.mtxr.sqltools-driver-sqlite
        open-vsx.naumovs.color-highlight
        open-vsx.njpwerner.autodocstring
        open-vsx.njqdev.vscode-python-typehint
        open-vsx.pkief.material-icon-theme
        open-vsx.pkief.material-product-icons
        open-vsx.pranaygp.vscode-css-peek
        open-vsx.psioniq.psi-header
        open-vsx.rebornix.ruby
        open-vsx.redhat.java
        open-vsx.redhat.vscode-xml
        open-vsx.redhat.vscode-yaml
        open-vsx.reditorsupport.r
        open-vsx.rust-lang.rust-analyzer
        open-vsx.swellaby.vscode-rust-test-adapter
        open-vsx.tamasfe.even-better-toml
        open-vsx.timonwong.shellcheck
        open-vsx.twxs.cmake
        open-vsx.usernamehw.errorlens
        open-vsx.vadimcn.vscode-lldb
        open-vsx.vscjava.vscode-gradle
        open-vsx.vscjava.vscode-java-debug
        open-vsx.vscjava.vscode-java-dependency
        open-vsx.vscjava.vscode-java-pack
        open-vsx.vscjava.vscode-java-test
        open-vsx.vscjava.vscode-maven
        open-vsx.waderyan.gitblame
        open-vsx.wingrunr21.vscode-ruby
        open-vsx.yzane.markdown-pdf
        open-vsx.yzhang.markdown-all-in-one
        open-vsx.zhuangtongfa.material-theme
        open-vsx.zignd.html-css-class-completion
      ];
      userSettings = {
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
        "eslint.nodePath" = "${eslint}/lib/node_modules/";
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
        "phpfmt.php_bin" = "${php}/bin/php";
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
