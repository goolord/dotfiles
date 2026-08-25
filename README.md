# dotfiles
contains configuration files for syncing across my machines

tendrils:
- https://github.com/goolord/shell-scripts
- https://github.com/goolord/nvim

main programs:
- zsh, zimfw
- alacritty
- sway (Linux)
- aerospace (macOS)
- nvim

## Quick Start

```shell
git clone git@github.com:goolord/dotfiles.git ~/Dev/dotfiles
cd ~/Dev/dotfiles
git lfs pull
```

### Arch Linux (fresh machine)

```shell
./bootstrap.sh
```

Installs paru, tendrils, pulls LFS assets, stows `home/`, installs AUR packages,
optional Haskell/Rust toolchains, enables greetd if present, stows `slash/` to `/`.

Re-link after pulling changes:

```shell
./home.sh    # repo wins over existing files
./slash.sh   # Linux only
```

Use `./home.sh --skip-existing` to keep local files that would block stow.

### macOS (existing machine)

Do **not** run `bootstrap.sh` or `slash.sh`.

```shell
./home.sh
```

Clone tendrils manually if missing. Install mac equivalents of tools via Homebrew.
AeroSpace reads `~/.aerospace.toml` (stowed from `home/.aerospace.toml`).

After pulling these changes on an existing machine:

```shell
rm -f ~/.pam_environment ~/.config/aerospace/aerospace.toml
rm -rf ~/.doom.d
./home.sh
```

## Structure

`home.sh` links `home/` to `~`. By default, conflicting targets are removed so
the repo version is stowed.

`slash.sh` links `slash/` to `/` (Linux only)

`update.sh` pulls this repo and its tendrils (when clone dirs exist)

`bin/aur` is the AUR helper shim (paru, then yay). Zsh defines `aur` to call it so
wrapper swaps do not require editing every script.

`aurpackages.txt` is a list of packages for Arch machines:

```shell
aur -S $(grep -Ev '^\s*(#|$)' aurpackages.txt | tr '\n' ' ') --needed --sudoloop
```

`grub.sh` regenerates GRUB config (Linux only).

`resources/` contains files which may be used in scripts / config files

## git-lfs

Font archives under `fonts/` and theme `*.gresource` files under `home/.themes/` use
Git LFS. Run `git lfs pull` after clone (bootstrap does this on Arch).
