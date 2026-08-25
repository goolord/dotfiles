#!/usr/bin/env bash
set -euo pipefail

# directory of dotfiles
export DIR="$(cd "$(dirname "$0")" && pwd -P)"
export TARGET_DIR=~/
unset STOW_SUDO

stow_command() {
  stow home -d "$DIR" -t "$TARGET_DIR" "$@"
}

export -f stow_command

"$DIR/stow.sh" "$@"
