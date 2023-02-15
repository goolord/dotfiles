export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export ZIM_HOME="$HOME/.config/zim"
export ZIM_CONFIG_FILE="$ZIM_HOME/zimrc"

[ -f "/Users/zach/.ghcup/env" ] && source "/Users/zach/.ghcup/env" # ghcup-env
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
