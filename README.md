# dotfiles
contains configuration files for syncing across my machines

deps:
- arch linux
- yay
- GNU stow
- git

tendrils:
- https://github.com/goolord/shell-scripts
- https://github.com/goolord/nvim

main programs:
  - zsh, zimfw
  - alacritty
  - sway
  - nvim

## Quick Start
run `./bootstrap.sh`

## Structure
`home.sh` will link `home/` to `~`

`slash.sh` will link `slash/` to `/`

`update.sh` will pull this repo and its tendrils

`aurpackages.txt` is a list of packages I like to have installed across my machines,
to install packages from it run

```shell
yay -S $(cat aurpackages.txt) --needed --sudoloop
```

`resources/` contains files which may be used in scripts / config files
