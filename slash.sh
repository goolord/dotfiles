#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != Linux ]]; then
  echo "slash.sh is Linux only (stows to /)." >&2
  exit 1
fi

# directory of dotfiles
export DIR="$(cd "$(dirname "$0")" && pwd -P)"
export TARGET_DIR=/
export STOW_SUDO=1

stow_command() {
  sudo stow slash -d "$DIR" -t "$TARGET_DIR" "$@"
}

export -f stow_command

install_nix_conf() {
  sudo install -Dm644 "$DIR/slash/etc/nix/nix.conf" /etc/nix/nix.conf
}

install_nix_conf
"$DIR/stow.sh" --skip-existing "$@"
