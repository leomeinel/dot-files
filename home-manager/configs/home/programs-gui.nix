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
      profiles =
        let
          # Extensions
          defaultExtensions = [
            open-vsx.bbenoist.doxygen
            open-vsx.christian-kohler.path-intellisense
            open-vsx.cschlosser.doxdocgen
            open-vsx.dotjoshjohnson.xml
            open-vsx.editorconfig.editorconfig
            open-vsx.esbenp.prettier-vscode
            open-vsx.fill-labs.dependi
            open-vsx.formulahendry.auto-close-tag
            open-vsx.formulahendry.auto-rename-tag
            open-vsx.formulahendry.code-runner
            open-vsx.franneck94.workspace-formatter
            open-vsx.gruntfuggly.activitusbar
            open-vsx.hangxingliu.vscode-nginx-conf-hint
            open-vsx.hbenl.test-adapter-converter
            open-vsx.hbenl.vscode-test-explorer
            open-vsx.htmlhint.vscode-htmlhint
            open-vsx.jnoortheen.nix-ide
            open-vsx.jock.svg
            open-vsx.kisstkondoros.vscode-gutter-preview
            open-vsx.kokororin.vscode-phpfmt
            open-vsx.mikestead.dotenv
            open-vsx.mkhl.shfmt
            open-vsx.mtxr.sqltools
            open-vsx.mtxr.sqltools-driver-mssql
            open-vsx.mtxr.sqltools-driver-mysql
            open-vsx.mtxr.sqltools-driver-pg
            open-vsx.mtxr.sqltools-driver-sqlite
            open-vsx.pkief.material-icon-theme
            open-vsx.pkief.material-product-icons
            open-vsx.pranaygp.vscode-css-peek
            open-vsx.psioniq.psi-header
            open-vsx.redhat.vscode-xml
            open-vsx.redhat.vscode-yaml
            open-vsx.streetsidesoftware.code-spell-checker
            open-vsx.streetsidesoftware.code-spell-checker-dutch
            open-vsx.streetsidesoftware.code-spell-checker-french
            open-vsx.streetsidesoftware.code-spell-checker-german
            open-vsx.streetsidesoftware.code-spell-checker-medical-terms
            open-vsx.streetsidesoftware.code-spell-checker-scientific-terms
            open-vsx.tamasfe.even-better-toml
            open-vsx.timonwong.shellcheck
            open-vsx.usernamehw.errorlens
            open-vsx.waderyan.gitblame
            open-vsx.yzane.markdown-pdf
            open-vsx.yzhang.markdown-all-in-one
            open-vsx.zhuangtongfa.material-theme
            open-vsx.zignd.html-css-class-completion
          ];
          cppExtensions = [
            open-vsx."13xforever".language-x86-64-assembly
            open-vsx.cheshirekow.cmake-format
            open-vsx.franneck94.vscode-c-cpp-config
            open-vsx.jeff-hykin.better-cpp-syntax
            open-vsx.llvm-vs-code-extensions.vscode-clangd
            open-vsx.twxs.cmake
            # FIXME: Use open-vsx version; It seems like this fails because 1.11.5 is maybe not supported in current nixpkgs
            #        error: failed to run custom build command for `lldb-stub v1.0.0 (/build/source/adapter/lldb-stub)`
            #        Caused by:
            #          process didn't exit successfully: `/build/source/target/release/build/lldb-stub-c2b3f4e211ef7d9c/build-script-build` (exit status: 101)
            #          --- stderr
            #          thread 'main' panicked at adapter/lldb-stub/build.rs:23:43:
            #          LLDB_DYLIB: NotPresent
            #          note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
            #        SEE: https://github.com/nix-community/nix-vscode-extensions/issues/127
            vscode-extensions.vadimcn.vscode-lldb
          ];
          dataScienceExtensions = [
            open-vsx.reditorsupport.r
          ];
          embeddedExtensions = [
            open-vsx.davidgomes.platformio-ide-cursor
          ];
          goExtensions = [
            open-vsx.golang.go
          ];
          javaExtensions = [
            open-vsx.fwcd.kotlin
            open-vsx.redhat.java
            open-vsx.vscjava.vscode-gradle
            open-vsx.vscjava.vscode-java-debug
            open-vsx.vscjava.vscode-java-dependency
            open-vsx.vscjava.vscode-java-test
            open-vsx.vscjava.vscode-maven
          ];
          pythonExtensions = [
            open-vsx.charliermarsh.ruff
            open-vsx.franneck94.vscode-python-config
            open-vsx.ms-python.black-formatter
            open-vsx.ms-python.isort
            open-vsx.ms-python.mypy-type-checker
            open-vsx.ms-python.python
            open-vsx.njpwerner.autodocstring
            open-vsx.njqdev.vscode-python-typehint
          ];
          rustExtensions = [
            open-vsx.rust-lang.rust-analyzer
            open-vsx.swellaby.vscode-rust-test-adapter
          ];
          webExtensions = [
            open-vsx.dbaeumer.vscode-eslint
            open-vsx.kofuk.hugo-utils
            open-vsx.svelte.svelte-vscode
            open-vsx.yandeu.five-server
          ];

          # Settings
          defaultSettings = {
            "activitusbar.activeColour" = "statusBar.foreground";
            "activitusbar.inactiveColour" = "statusBar.foreground";
            "code-runner.clearPreviousOutput" = true;
            "code-runner.enableAppInsights" = false;
            "code-runner.runInTerminal" = true;
            "code-runner.saveFileBeforeRun" = true;
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
            "git.detectSubmodules" = true;
            "git.detectSubmodulesLimit" = 100;
            "git.enableCommitSigning" = true;
            "git.enableSmartCommit" = true;
            "git.enableStatusBarSync" = false;
            "git.fetchOnPull" = true;
            "git.ignoreSubmodules" = true;
            "git.scanRepositories" = [ "${config.home.homeDirectory}/src" ];
            "gitblame.statusBarMessageFormat" = "\${author.name} (\${time.ago})";
            "github.gitProtocol" = "ssh";
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
            "phpfmt.php_bin" = "${php}/bin/php";
            "prettier.trailingComma" = "none";
            "prettier.withNodeModules" = true;
            "redhat.telemetry.enabled" = false;
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
          cppSettings = {
            "[c]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
            };
            "[cpp]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
            };
          };
          dataScienceSettings = {
            "r.libPaths" = [
              "${rPackages.languageserver}/library"
              "${rPackages.jsonlite}/library"
              "${rPackages.httpgd}/library"
            ];
            "r.plot.useHttpgd" = true;
            "r.rpath.linux" = "${rWrapper}/bin/R";
          };
          embeddedSettings = {
            "platformio-ide.disablePIOHomeStartup" = true;
            "platformio-ide.autoOpenPlatformIOIniFile" = false;
            "platformio-ide.customPATH" = "/usr/bin/platformio";
            "platformio-ide.useBuiltinPIOCore" = false;
            "platformio-ide.useBuiltinPython" = false;
          };
          goSettings = {
            "go.gopath" = "${go}/bin/go";
          };
          javaSettings = {
            "java.eclipse.downloadSources" = true;
            "java.format.settings.url" = "${config.xdg.configHome}/eclipse-style-guides/java.xml";
            "[java]" = {
              "editor.defaultFormatter" = "redhat.java";
            };
          };
          pythonSettings = {
            "python.languageServer" = "Jedi";
          };
          rustSettings = {
            "rust-analyzer.check.command" = "${rustup}/bin/cargo-clippy";
            "rust-analyzer.checkOnSave" = true;
            "rust-analyzer.debug.engine" = "vadimcn.vscode-lldb";
            "[rust]" = {
              "editor.defaultFormatter" = "rust-lang.rust-analyzer";
            };
          };
          webSettings = {
            "svelte.enable-ts-plugin" = true;
            "[svelte]" = {
              "editor.defaultFormatter" = "svelte.svelte-vscode";
            };
          };

          # Profiles
          profiles = {
            default = {
              enableExtensionUpdateCheck = false;
              enableUpdateCheck = false;
              extensions = defaultExtensions;
              userSettings = defaultSettings;
            };
            cpp = {
              extensions = defaultExtensions ++ cppExtensions;
              userSettings = defaultSettings // cppSettings;
            };
            dataScience = {
              extensions = defaultExtensions ++ dataScienceExtensions ++ pythonExtensions;
              userSettings = defaultSettings // dataScienceSettings // pythonSettings;
            };
            embedded = {
              extensions = defaultExtensions ++ cppExtensions ++ embeddedExtensions;
              userSettings = defaultSettings // cppSettings // embeddedSettings;
            };
            go = {
              extensions = defaultExtensions ++ goExtensions;
              userSettings = defaultSettings // goSettings;
            };
            java = {
              extensions = defaultExtensions ++ javaExtensions;
              userSettings = defaultSettings // javaSettings;
            };
            python = {
              extensions = defaultExtensions ++ pythonExtensions;
              userSettings = defaultSettings // pythonSettings;
            };
            rust = {
              extensions = defaultExtensions ++ rustExtensions;
              userSettings = defaultSettings // rustSettings;
            };
            web = {
              extensions = defaultExtensions ++ webExtensions;
              userSettings = defaultSettings // webSettings;
            };
            full = {
              extensions =
                defaultExtensions
                ++ cppExtensions
                ++ dataScienceExtensions
                ++ embeddedExtensions
                ++ goExtensions
                ++ javaExtensions
                ++ pythonExtensions
                ++ rustExtensions
                ++ webExtensions;
              userSettings =
                defaultSettings
                // cppSettings
                // dataScienceSettings
                // embeddedSettings
                // goSettings
                // javaSettings
                // pythonSettings
                // rustSettings
                // webSettings;
            };
          };
        in
        {
          default = defaultprofiles.default;
          cpp = defaultprofiles.cpp;
          dataScience = defaultprofiles.dataScience;
          embedded = defaultprofiles.embedded;
          go = defaultprofiles.go;
          java = defaultprofiles.java;
          python = defaultprofiles.python;
          rust = defaultprofiles.rust;
          web = defaultprofiles.web;
          full = defaultprofiles.full;
        };
    };
  };
}
