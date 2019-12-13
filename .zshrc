fpath+=~/.zfunc

export ZSH=$HOME/.oh-my-zsh

source /etc/profile
export NIXPKGS=$HOME/Dev/nixpkgs
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# add support for ctrl+o to open selected file in vim
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
export ZSH_THEME=ysn

plugins=(
  git
  zsh-autosuggestions
  fzf
  nix-shell
)


source $ZSH/oh-my-zsh.sh

. /home/zach/.nix-profile/etc/profile.d/nix.sh

# Aliases
alias ssh="TERM=xterm-256color ssh"
alias pm="sudo pacman"
alias mocp="mocp -T transparent-background"
alias mkalias="vim $HOME/.zshrc"
alias music="udisksctl mount -b /dev/sda2 > /dev/null 2>&1; cd /run/media/zachchurchill/1AD2B07DD2B05EA7/music/; mocp -m"
alias youtubeflac="youtube-dl --extract-audio --audio-format flac -o '%(autonumber)s.%(title)s.%(ext)s' "
alias neofetch="neofetch \
--block_range 1 14 \
--uptime_shorthand on \
--gtk_shorthand on \
--ascii_logo_size small \
--speed_shorthand on \
"
alias fetch="neofetch"
alias colortest="$HOME/Documents/shell-scripts/colortest.sh"
alias sudo="sudo -E"
alias gksudo="gksudo -k"
alias unrarall="find ./ -name \*.rar -exec unrar x -y  {} \;"
alias unzipall="find ./ -name \*.zip -exec unzip {} \;"
alias unfolder="find . -mindepth 2 -type f -print -exec mv {} . \;"
alias listenmic="pactl load-module module-loopback latency_msec=200"
alias unlistenmic="pactl unload-module module-loopback"
alias emacscli="emacs -nw"
alias ds4="ds4drv --hidraw --led 000002"
alias flux="blueshift -t 5500"
alias unflux="blueshift -r"
alias weather="curl wttr.in/Norcross"
alias rampart="sudo mount -t tmpfs tmpfs /mnt -o size=1024m && cd /mnt"
alias nixp="nix-env"
alias snr='nix-repl "<nixpkgs>"'
alias vim="nvim"
alias bat="bat --paging never"
alias cat="bat --paging never -p"
alias pingp='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="htop"
alias htop="TERM=xterm-256color htop"
alias tmux="tmux -f ~/.config/tmux.conf"
alias ghcidns="nix-shell --run 'ghcid -c cabal new-repl'"
alias ghcidc="ghcid -c cabal v2-repl"
alias nixmaster="nix-env -f -f https://github.com/NixOS/nixpkgs/archive/master.tar.gz -iA"
alias gp-l3='sudo openconnect --protocol=gp sentinela.layer3com.com'
function clone() {
  git clone git@github.com:$1/$2.git && cd $2
}
