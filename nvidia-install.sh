#!/bin/sh

# Fail on error
set -e

# Generate ~/.nvidia-settings-rc
nvidia-settings -r

# Remove script
rm -rf ~/nvidia-install.sh
