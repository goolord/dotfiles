export ZIM_HOME="$ZDOTDIR/.zim"
export ZIM_CONFIG_FILE="$ZDOTDIR/zimrc"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim

[ -f "/Users/zach/.ghcup/env" ] && source "/Users/zach/.ghcup/env" # ghcup-env
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
