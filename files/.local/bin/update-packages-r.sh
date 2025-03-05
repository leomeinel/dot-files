#!/usr/bin/env bash
###
# File: update-packages-r.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# FIXME: Since vscDebugger isn't available in default repo, this call fails when reaching it. I might not fix this soon since I haven't really used R anyways :D
# Source: https://www.r-bloggers.com/2014/11/update-all-user-installed-r-packages-again/. This basically reinstalls every single package, not sure if this is actually needed.
R -e 'install.packages(lib  = lib <- .libPaths()[1], pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package, type = "source")'
