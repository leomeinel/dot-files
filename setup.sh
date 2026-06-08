#!/usr/bin/env bash

# Fail on error
set -e

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
set -a
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/install.env
set +a

# Source ~/.bash_profile
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/home/dot_bash_profile

chezmoi apply

# Notify user if script has finished successfully
echo "'$(basename "${0}")' has finished successfully."
