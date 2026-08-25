#!/usr/bin/env bash
set -euo pipefail

# directory of dotfiles
export DIR="$(cd "$(dirname "$0")" && pwd -P)"
export TARGET_DIR=~/
unset STOW_SUDO

stow_command() {
  stow home -d "$DIR" -t "$TARGET_DIR" \
    --ignore='bookmarks' \
    --ignore='prompts-library-db' \
    --ignore='\.zsh_history' \
    --ignore='\.zcompdump' \
    --ignore='\.zhistory' \
    --ignore='(^|/)\.zim' \
    "$@"
}

export -f stow_command

"$DIR/stow.sh" "$@"

# Restricted nix settings belong in /etc/nix/nix.conf (slash/etc/nix/nix.conf).
rm -f ~/.config/nix/nix.conf

if command -v nix-channel &>/dev/null && [[ -f ~/.nix-channels ]]; then
  nix-channel --update
fi
