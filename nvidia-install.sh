#!/bin/sh

# Fail on error
set -e

# Generate ~/.nvidia-settings-rc
nvidia-settings -r

# Remove script
rm ~/nvidia-install.sh
