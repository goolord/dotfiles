for candidate in "$HOME/Dev/dotfiles" "$HOME/dotfiles"; do
  [[ -d "$candidate/bin" ]] && export DOTFILES="$candidate" && break
done

export ZIM_HOME="$ZDOTDIR/.zim"
export ZIM_CONFIG_FILE="$ZDOTDIR/zimrc"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
# neither work :V
# unset HISTFILE
# export HISTFILE=${XDG_DATA_HOME:-$HOME/.local/data}/zsh_history

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# . "$HOME/.cargo/env"
