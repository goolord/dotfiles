#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd -P)"
export PATH="$DIR/bin:$PATH"

if [[ "$(uname -s)" != Linux ]]; then
  echo "bootstrap.sh is Arch Linux only. On macOS run: ./home.sh" >&2
  exit 1
fi

if ! command -v paru &>/dev/null; then
  sudo pacman -S --needed base-devel git
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  git clone https://aur.archlinux.org/paru.git "$tmp/paru"
  (cd "$tmp/paru" && makepkg -si)
fi

if ! command -v stow &>/dev/null; then
  sudo pacman -S --needed stow
fi

if ! command -v git &>/dev/null; then
  sudo pacman -S --needed git
fi

if ! command -v git-lfs &>/dev/null; then
  sudo pacman -S --needed git-lfs
fi

git lfs install --local 2>/dev/null || git lfs install
git lfs pull

if ! [[ -d ~/Dev/shell-scripts ]]; then
  mkdir -p ~/Dev
  git clone git@github.com:goolord/shell-scripts.git ~/Dev/shell-scripts -q
fi

if ! [[ -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim
  git clone git@github.com:goolord/nvim.git ~/.config/nvim -q
fi

"$DIR/home.sh"

mapfile -t packages < <(grep -Ev '^\s*(#|$)' "$DIR/aurpackages.txt")
aur -S "${packages[@]}" --needed --sudoloop

if ! [[ -d ~/.ghcup/ ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org \
    | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 sh
fi

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

if command -v cabal &>/dev/null; then
  mapfile -t cabal_packages < <(grep -Ev '^\s*(#|$)' "$DIR/cabalpackages.txt")
  cabal install "${cabal_packages[@]}" --overwrite-policy=always
fi

if command -v cargo &>/dev/null; then
  mapfile -t cargo_packages < <(grep -Ev '^\s*(#|$)' "$DIR/cargopackages.txt")
  cargo install "${cargo_packages[@]}"
fi

if command -v systemctl &>/dev/null && pacman -Q greetd &>/dev/null; then
  sudo systemctl enable greetd.service
fi

"$DIR/slash.sh"
