/*
  File: programs-gui.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
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
          defaultExtensions = nix4vscode.forOpenVsx [
            "bbenoist.doxygen"
            "christian-kohler.path-intellisense"
            "cschlosser.doxdocgen"
            "dotjoshjohnson.xml"
            "editorconfig.editorconfig"
            "esbenp.prettier-vscode"
            "fill-labs.dependi"
            "formulahendry.code-runner"
            "franneck94.workspace-formatter"
            "gruntfuggly.activitusbar"
            "hangxingliu.vscode-nginx-conf-hint"
            "ms-vscode.test-adapter-converter"
            "hbenl.vscode-test-explorer"
            "htmlhint.vscode-htmlhint"
            "jnoortheen.nix-ide"
            "jock.svg"
            "kisstkondoros.vscode-gutter-preview"
            "kokororin.vscode-phpfmt"
            "mikestead.dotenv"
            "mkhl.shfmt"
            "mtxr.sqltools"
            "mtxr.sqltools-driver-mssql"
            "mtxr.sqltools-driver-mysql"
            "mtxr.sqltools-driver-pg"
            "mtxr.sqltools-driver-sqlite"
            "pkief.material-icon-theme"
            "pkief.material-product-icons"
            "pranaygp.vscode-css-peek"
            "psioniq.psi-header"
            "redhat.vscode-xml"
            "redhat.vscode-yaml"
            "streetsidesoftware.code-spell-checker"
            "streetsidesoftware.code-spell-checker-dutch"
            "streetsidesoftware.code-spell-checker-french"
            "streetsidesoftware.code-spell-checker-german"
            "streetsidesoftware.code-spell-checker-medical-terms"
            "streetsidesoftware.code-spell-checker-scientific-terms"
            "tamasfe.even-better-toml"
            "timonwong.shellcheck"
            "usernamehw.errorlens"
            "waderyan.gitblame"
            "yzane.markdown-pdf"
            "yzhang.markdown-all-in-one"
            "zhuangtongfa.material-theme"
            "zignd.html-css-class-completion"
          ];
          cppExtensions = nix4vscode.forOpenVsx [
            "13xforever.language-x86-64-assembly"
            "cheshirekow.cmake-format"
            "franneck94.vscode-c-cpp-config"
            "jeff-hykin.better-cpp-syntax"
            "llvm-vs-code-extensions.vscode-clangd"
            "twxs.cmake"
            "vadimcn.vscode-lldb"
          ];
          dataScienceExtensions = nix4vscode.forOpenVsx [
            "reditorsupport.r"
          ];
          embeddedExtensions = nix4vscode.forOpenVsx [
            # FIXME: Uncomment after fix
            #        error: Extension davidgomes.platformio-ide not found in /nix/store/XXX-extensions_openvsx.json
            #   See: https://github.com/nix-community/nix4vscode/issues/337
            # "davidgomes.platformio-ide"
          ];
          goExtensions = nix4vscode.forOpenVsx [
            "golang.go"
          ];
          javaExtensions = nix4vscode.forOpenVsx [
            "fwcd.kotlin"
            "redhat.java"
            "vscjava.vscode-gradle"
            "vscjava.vscode-java-debug"
            "vscjava.vscode-java-dependency"
            "vscjava.vscode-java-test"
            "vscjava.vscode-maven"
          ];
          pythonExtensions = nix4vscode.forOpenVsx [
            "charliermarsh.ruff"
            "franneck94.vscode-python-config"
            "ms-python.black-formatter"
            "ms-python.isort"
            "ms-python.mypy-type-checker"
            "ms-python.python"
            "njpwerner.autodocstring"
            "njqdev.vscode-python-typehint"
          ];
          rustExtensions = nix4vscode.forOpenVsx [
            "rust-lang.rust-analyzer"
            "swellaby.vscode-rust-test-adapter"
          ];
          webExtensions = nix4vscode.forOpenVsx [
            "dbaeumer.vscode-eslint"
            "kofuk.hugo-utils"
            "svelte.svelte-vscode"
            "yandeu.five-server"
          ];

          # Settings
          # FIXME: See https://github.com/VSCodium/vscodium/issues/2522
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
            "editor.indentSize" = "tabSize";
            "editor.insertSpaces" = true;
            "editor.linkedEditing" = true;
            "editor.multiCursorModifier" = "ctrlCmd";
            "editor.scrollbar.horizontalScrollbarSize" = 10;
            "editor.scrollbar.verticalScrollbarSize" = 10;
            "editor.scrollBeyondLastLine" = false;
            "editor.tabCompletion" = "on";
            "editor.tabSize" = 4;
            "editor.unfoldOnClickAfterEndOfLine" = true;
            "evenBetterToml.formatter.indentString" = " ";
            "explorer.confirmDelete" = false;
            "files.autoSave" = "afterDelay";
            "files.insertFinalNewline" = true;
            "files.trimTrailingWhitespace" = true;
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
            "git.openRepositoryInParentFolders" = "always";
            "git.scanRepositories" = [ "${config.home.homeDirectory}/src" ];
            "gitblame.statusBarMessageFormat" = "\${author.name} (\${time.ago})";
            "github.gitProtocol" = "ssh";
            "html.autoClosingTags" = true;
            "javascript.autoClosingTags" = true;
            "markdown-pdf.displayHeaderFooter" = false;
            "markdown-pdf.omitBackground" = true;
            "markdown-pdf.outputDirectory" = "markdown-pdf";
            "markdown-pdf.outputDirectoryRelativePathFile" = true;
            "markdown.extension.toc.orderedList" = true;
            "material-icon-theme.hidesExplorerArrows" = true;
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";
            "oneDarkPro.editorTheme" = "One Dark Pro Darker";
            "phpfmt.php_bin" = "/usr/bin/php";
            "prettier.trailingComma" = "none";
            "prettier.withNodeModules" = true;
            "redhat.telemetry.enabled" = false;
            "scm.repositories.sortOrder" = "name";
            "search.showLineNumbers" = true;
            "search.smartCase" = true;
            "search.useIgnoreFiles" = false;
            "shellcheck.executablePath" = "/usr/bin/shellcheck";
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
            "typescript.autoClosingTags" = true;
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
            "xml.completion.autoCloseTags" = true;
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
              "include" = [
                "bat"
                "c"
                "nix"
                "dockerfile"
                "fsharp"
                "haml"
                "lua"
                "jade"
                "powershell"
                "python"
                "razor"
                "shellscript"
                "slim"
                "vb"
                "cpp"
                "csharp"
                "cuda-cpp"
                "css"
                "go"
                "java"
                "javascript"
                "javascriptreact"
                "less"
                "objective-c"
                "objective-cpp"
                "php"
                "rust"
                "sql"
                "stylus"
                "swift"
                "typescript"
                "typescriptreact"
                "perl"
                "perl6"
                "r"
                "ruby"
                "scss"
                "toml"
                "html"
                "vue"
                "vue-html"
                "pug"
                "sass"
                "shaderlab"
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
                "prefix" = "REM ";
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
                "prefix" = "  ";
                "end" = "-->";
              }
              {
                "language" = "lua";
                "begin" = "--[[";
                "prefix" = "  ";
                "end" = "--]]";
              }
              {
                "language" = "jade";
                "begin" = "";
                "prefix" = "// ";
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
                "prefix" = "/ ";
                "end" = "";
              }
              {
                "language" = "vb";
                "begin" = "";
                "prefix" = "' ";
                "end" = "";
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
            "[css]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[html]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[javascript]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[markdown]" = {
              "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
            };
            "[shellscript]" = {
              "editor.defaultFormatter" = "mkhl.shfmt";
              "editor.insertSpaces" = true;
            };
            "[sql]" = {
              "editor.defaultFormatter" = "mtxr.sqltools";
            };
            "[typescript]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[json]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[jsonc]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[yaml]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
              "editor.tabSize" = 2;
            };
            "[xml]" = {
              "editor.defaultFormatter" = "DotJoshJohnson.xml";
              "editor.tabSize" = 2;
            };
          };
          cppSettings = {
            "clangd.arguments" = [
              "--clang-tidy"
            ];
            "[c]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
              "editor.tabSize" = 2;
            };
            "[cpp]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
              "editor.tabSize" = 2;
            };
            "[objective-c]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
              "editor.tabSize" = 2;
            };
            "[objective-cpp]" = {
              "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
              "editor.tabSize" = 2;
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
            "go.gopath" = "/usr/bin/go";
          };
          javaSettings = {
            "java.eclipse.downloadSources" = true;
            "java.format.settings.url" = "${config.xdg.configHome}/eclipse-style-guides/java.xml";
            "[java]" = {
              "editor.defaultFormatter" = "redhat.java";
              "editor.tabSize" = 2;
            };
          };
          pythonSettings = {
            "python.languageServer" = "Jedi";
          };
          rustSettings = {
            "rust-analyzer.check.command" = "/usr/bin/cargo-clippy";
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
              "editor.tabSize" = 2;
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
          default = profiles.default;
          cpp = profiles.cpp;
          dataScience = profiles.dataScience;
          embedded = profiles.embedded;
          go = profiles.go;
          java = profiles.java;
          python = profiles.python;
          rust = profiles.rust;
          web = profiles.web;
          full = profiles.full;
        };
    };
  };
}
