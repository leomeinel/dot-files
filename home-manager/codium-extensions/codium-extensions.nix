# Warning, this file is autogenerated by nix4vscode. Don't modify this manually.
{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        "jeff-hykin"."better-cpp-syntax" = vscode-utils.extensionFromVscodeMarketplace {
          name = "better-cpp-syntax";
          publisher = "jeff-hykin";
          version = "1.27.1";
          sha256 = "037nigza7n71j5vgl3qw0swrmy8gvfj9m8jbi1nb2a3lmsifivqq";

        };
        "pranaygp"."vscode-css-peek" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-css-peek";
          publisher = "pranaygp";
          version = "4.4.3";
          sha256 = "05b2xrrhjss7icm2w0xqb6j5wbqy1lrxh92ihjwkqfgn7fjad3x1";

        };
        "mtxr"."sqltools-driver-mssql" = vscode-utils.extensionFromVscodeMarketplace {
          name = "sqltools-driver-mssql";
          publisher = "mtxr";
          version = "0.4.4";
          sha256 = "1fznfdc2mk7g8pafdw3vzls69l0qv2wgcrmzxghyj5bsf06ig666";

        };
        "franneck94"."vscode-c-cpp-dev-extension-pack" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-c-cpp-dev-extension-pack";
          publisher = "franneck94";
          version = "0.10.0";
          sha256 = "0dqyr8kyj6qj34x34x078b5xflhlzvi1k7ld3hzm1mf9l5y2mdgg";

        };
        "kokororin"."vscode-phpfmt" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-phpfmt";
          publisher = "kokororin";
          version = "1.2.41";
          sha256 = "033y599slnw73p8c23i4nxfn9rngi4gdr0mb0xr7vlc2ba5f0r4q";

        };
        "rdebugger"."r-debugger" = vscode-utils.extensionFromVscodeMarketplace {
          name = "r-debugger";
          publisher = "rdebugger";
          version = "0.5.5";
          sha256 = "0v45fbcpqgdlql4splslvccccrrsnrcxs1qqcx5bv7a0r6v9l7s5";

        };
        "franneck94"."workspace-formatter" = vscode-utils.extensionFromVscodeMarketplace {
          name = "workspace-formatter";
          publisher = "franneck94";
          version = "1.1.0";
          sha256 = "0rliczyvv7c3bpy1drksm31gha2sqp7x3v6v83y9gz2jq190m9bx";

        };
        "psioniq"."psi-header" = vscode-utils.extensionFromVscodeMarketplace {
          name = "psi-header";
          publisher = "psioniq";
          version = "1.25.1";
          sha256 = "0hsx8nghwcijdydy2wd16g4a1gz1d7lbyxszk1rz6k7wa36wzgya";

        };
        "hangxingliu"."vscode-nginx-conf-hint" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-nginx-conf-hint";
          publisher = "hangxingliu";
          version = "0.3.1";
          sha256 = "0ssskps24anri14yvg7cg4xvc0mppw9vry20ki1si3m3q9rhfp5p";

        };
        "franneck94"."vscode-python-dev-extension-pack" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-python-dev-extension-pack";
          publisher = "franneck94";
          version = "2.0.0";
          sha256 = "0icws51p3kzvi0wd95db9infvjfdgklrn1nyv9qw6zr6scdmzwdm";

        };
        "htmlhint"."vscode-htmlhint" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-htmlhint";
          publisher = "htmlhint";
          version = "1.0.5";
          sha256 = "079rpiy0fxhzsd6cli4nxbl3r9kmw98wcjmssm304ab1f4ghlj1c";

        };
        "zignd"."html-css-class-completion" = vscode-utils.extensionFromVscodeMarketplace {
          name = "html-css-class-completion";
          publisher = "zignd";
          version = "1.20.0";
          sha256 = "1hc2dgib3wryygb36h47wzf32iv1x6rn1swmbgchiyjw62jjj4fw";

        };
        "ms-vscode"."cpptools-themes" = vscode-utils.extensionFromVscodeMarketplace {
          name = "cpptools-themes";
          publisher = "ms-vscode";
          version = "2.0.0";
          sha256 = "05r7hfphhlns2i7zdplzrad2224vdkgzb0dbxg40nwiyq193jq31";

        };
        "kisstkondoros"."vscode-gutter-preview" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-gutter-preview";
          publisher = "kisstkondoros";
          version = "0.32.2";
          sha256 = "1b8rp41j99li2718599lrvr8y49h8vlz20vzl1wxdjxhdd8gi2i4";

        };
        "mtxr"."sqltools" = vscode-utils.extensionFromVscodeMarketplace {
          name = "sqltools";
          publisher = "mtxr";
          version = "0.28.4";
          sha256 = "0bszagbm10004rx2jdhg2g33wg0f1l0kp3cs1jzkdj1r4an9w5qk";

        };
        "gruntfuggly"."activitusbar" = vscode-utils.extensionFromVscodeMarketplace {
          name = "activitusbar";
          publisher = "gruntfuggly";
          version = "0.0.47";
          sha256 = "16ianj0cdnzmqnq3jnx5nd7yd9w0fmrzwdn3d2a1r7a5r05y9f44";

        };
        "franneck94"."c-cpp-runner" = vscode-utils.extensionFromVscodeMarketplace {
          name = "c-cpp-runner";
          publisher = "franneck94";
          version = "9.4.10";
          sha256 = "187rybxj8i2flnljac2fhcbb6mpk4i33j9293ph8zzdv5i2y21wh";

        };
        "mtxr"."sqltools-driver-mysql" = vscode-utils.extensionFromVscodeMarketplace {
          name = "sqltools-driver-mysql";
          publisher = "mtxr";
          version = "0.6.4";
          sha256 = "0fw4w5pfw91s8lbam1k81g9vwjgrpn93dd05lr7r9rgzdw102fcf";

        };
        "cschlosser"."doxdocgen" = vscode-utils.extensionFromVscodeMarketplace {
          name = "doxdocgen";
          publisher = "cschlosser";
          version = "1.4.0";
          sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";

        };
        "13xforever"."language-x86-64-assembly" = vscode-utils.extensionFromVscodeMarketplace {
          name = "language-x86-64-assembly";
          publisher = "13xforever";
          version = "3.1.4";
          sha256 = "1kvy9kxgnm6r9973zyk65z5w2a54dh2iclm091gv067pa6dl750l";

        };
        "mtxr"."sqltools-driver-sqlite" = vscode-utils.extensionFromVscodeMarketplace {
          name = "sqltools-driver-sqlite";
          publisher = "mtxr";
          version = "0.5.2";
          sha256 = "0rfs00s3im85b3ip1af1jv4qf33dcx8wzr9nlfl08sbjb4b20gk9";

        };
        "swellaby"."vscode-rust-test-adapter" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-rust-test-adapter";
          publisher = "swellaby";
          version = "0.11.0";
          sha256 = "111vhl71zzh4il1kh21l49alwlllzcvmdbsxyvk9bq3r24hxq1r2";

        };
        "njqdev"."vscode-python-typehint" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-python-typehint";
          publisher = "njqdev";
          version = "1.5.1";
          sha256 = "0ra3jg8xwa8vssz33cgfkjbn4chsir1xlzshij0jn37zmw42q8q8";

        };
        "franneck94"."vscode-python-config" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-python-config";
          publisher = "franneck94";
          version = "12.4.0";
          sha256 = "1dpsjqilijlj1i66721xla6h9979vibgms0ryr71nyga5yazq7s1";

        };
        "mtxr"."sqltools-driver-pg" = vscode-utils.extensionFromVscodeMarketplace {
          name = "sqltools-driver-pg";
          publisher = "mtxr";
          version = "0.5.5";
          sha256 = "0fwjkn0aicfv9b5y1d7pjxpz9mdchs7ygidiyf8gcn2j65q34p07";

        };
        "franneck94"."vscode-c-cpp-config" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-c-cpp-config";
          publisher = "franneck94";
          version = "6.3.0";
          sha256 = "1js5bw7aas9j3c1iaa7rh5vjfpyxxqgdpq5583xn9l1hgjvmkg50";

        };
        "mkhl"."shfmt" = vscode-utils.extensionFromVscodeMarketplace {
          name = "shfmt";
          publisher = "mkhl";
          version = "1.3.1";
          sha256 = "0zp1lhx0l9nyrpsdws6jmrjqi7bkdj3mzx7l1d5l56cv0qzmgfjp";

        };
        "fwcd"."kotlin" = vscode-utils.extensionFromVscodeMarketplace {
          name = "kotlin";
          publisher = "fwcd";
          version = "0.2.36";
          sha256 = "1cwncjvarq3g0cmn9afdd15s81nms0kcawnj3midhr4hchap2aml";

        };
        "bierner"."color-info" = vscode-utils.extensionFromVscodeMarketplace {
          name = "color-info";
          publisher = "bierner";
          version = "0.7.2";
          sha256 = "1pdzqzp8wp02w4fbakn7svb47b5xm9vj2qf47bxi3jvqvf2jvz85";

        };
        "cheshirekow"."cmake-format" = vscode-utils.extensionFromVscodeMarketplace {
          name = "cmake-format";
          publisher = "cheshirekow";
          version = "0.6.11";
          sha256 = "14v0wb00iy38ry9bfpzz4fjraggy4ygg5v622mfpxb7498kkrm9m";

        };
        "bbenoist"."doxygen" = vscode-utils.extensionFromVscodeMarketplace {
          name = "doxygen";
          publisher = "bbenoist";
          version = "1.0.0";
          sha256 = "0kclb60mnaj3c5lmpwmhkbnx4g8gr4wy66lkcklkwm555nkgw48n";

        };
        "ms-python"."mypy-type-checker" = vscode-utils.extensionFromVscodeMarketplace {
          name = "mypy-type-checker";
          publisher = "ms-python";
          version = "2025.2.0";
          sha256 = "125vr6irqn5q78ydgrql3lfkwjn264amzv52qkh8hv0w5r4dg7sl";

        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) { }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) { }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) { }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) { })

