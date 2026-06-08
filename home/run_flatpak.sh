#!/usr/bin/env bash

# Fail on error
set -e

# FIXME: This shouldn't be necessary
# Use flatpak overrides to allow consistent theming
flatpak override -u --reset
rm -rf "${XDG_DATA_HOME}"/fonts
rsync -urlq --delete /usr/share/fonts/ "${XDG_DATA_HOME}"/fonts
flatpak override -u --filesystem=xdg-data/fonts:ro
rm -rf "${XDG_DATA_HOME}"/icons
rsync -urlq --delete /usr/share/icons/ "${XDG_DATA_HOME}"/icons
flatpak override -u --filesystem=xdg-data/icons:ro
rm -rf "${XDG_DATA_HOME}"/themes
rsync -urlq --delete /usr/share/themes/ "${XDG_DATA_HOME}"/themes
flatpak override -u --filesystem=xdg-data/themes:ro
flatpak override -u --env=QT_STYLE_OVERRIDE="breeze"
