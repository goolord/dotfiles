source ~/.config/zim/zim.zsh
fpath+=~/.zfunc

source /etc/profile
export NIXPKGS=$HOME/Dev/nixpkgs
export SKIM_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export CARP_DIR=~/Dev/Carp/
export BAT_THEME="gruvbox-dark"

. /home/zach/.nix-profile/etc/profile.d/nix.sh

# Aliases
setopt complete_aliases

alias ssh="TERM=xterm-256color ssh"
alias pm="sudo pacman"
alias mocp="mocp -T transparent-background"
alias mkalias="vim $HOME/.zshrc +"
alias music="udisksctl mount -b /dev/sda2 > /dev/null 2>&1; cd /run/media/zachchurchill/1AD2B07DD2B05EA7/music/; mocp -m"
alias youtubeflac="youtube-dl --extract-audio --audio-format flac -o '%(autonumber)s.%(title)s.%(ext)s' "
alias neofetch="neofetch \
--block_range 1 14 \
--uptime_shorthand on \
--gtk_shorthand on \
--ascii_logo_size small \
--speed_shorthand on \
"
alias sudo="sudo -E"
alias gksudo="gksudo -k"
alias unrarall="find ./ -name \*.rar -exec unrar x -y  {} \;"
alias unzipall="find ./ -name \*.zip -exec unzip {} \;"
alias unfolder="find . -mindepth 2 -type f -print -exec mv {} . \;"
alias listenmic="pactl load-module module-loopback latency_msec=200"
alias unlistenmic="pactl unload-module module-loopback"
alias emacscli="emacs -nw"
alias ds4="ds4drv --hidraw --led 000002"
alias flux="redshift -O 5500"
alias unflux="redshift -x"
alias weather="curl wttr.in/Norcross"
alias rampart="sudo mount -t tmpfs tmpfs /mnt -o size=1024m && cd /mnt"
alias nixp="nix-env"
alias snr='nix-repl "<nixpkgs>"'
alias vim="nvim"
alias cat="bat --paging never -p"
alias pingp='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="htop"
alias htop="TERM=xterm-256color htop"
alias tmux="tmux -f ~/.config/tmux.conf"
function rgless () { rg "$@" --color always --column | less -r }
function clone() { git clone git@github.com:$1/$2.git && cd $2 }
function doppelganger() { PWD=$(pwd) "$TERM" & disown }
alias dumpcore="cabal exec -- ghc-core --no-asm --no-cast"
function gitignore () {
  curl https://raw.githubusercontent.com/github/gitignore/master/${(C)1}.gitignore > .gitignore
}
alias smurf-docker-ghcid="docker-compose up -d stack localstack postgres"
alias hasktags="hasktags -c -R -x ."
function nvim-closest() {
  nvim $(fd -p $@)
}
function nvcp() {
  nvim-closest $(wl-paste)
}

source /home/zach/.config/broot/launcher/bash/br
