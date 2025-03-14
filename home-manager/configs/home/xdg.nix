/*
  File = xdg.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  ...
}:

{
  xdg = {
    enable = true;
    configFile = {
      # git
      "git/config" = {
        text = ''
          [user]
          email = "leo@meinel.dev"
          name = "Leopold Johannes Meinel"
          signingkey = REPLACE_GIT_SIGNING_KEY

          [core]
          editor = nvim
          pager = delta
          autocrlf = input

          [init]
          defaultBranch = main

          [pull]
          rebase = true

          [commit]
          gpgsign = true

          [merge]
          conflictstyle = diff3

          [diff]
          colorMoved = default

          [interactive]
          diffFilter = delta --color-only --features=interactive
          [add.interactive]
          useBuiltin = false

          [delta]
          navigate = true
          light = false
          features = decorations
          [delta "interactive"]
          keep-plus-minus-markers = false
          [delta "decorations"]
          commit-decoration-style = blue ol
          commit-style = raw
          file-style = omit
          hunk-header-decoration-style = blue box
          hunk-header-file-style = red
          hunk-header-line-number-style = "#067a00"
          hunk-header-style = file line-number syntax

          [credential]
          helper = /usr/lib/git-core/git-credential-libsecret
        '';
      };
      # nvim
      "nvim" = {
        # FIXME: Find out if also sourcing in lua/plugin is necessary
        source = ../../files/.config/nvim;
        recursive = true;
      }
    };
  };
}
