source ~/.config/zim/zim.zsh
fpath+=~/.zfunc

source /etc/profile

export NIXPKGS=$HOME/Dev/nixpkgs
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# add support for ctrl+o to open selected file in vim
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"

export CARP_DIR=~/Dev/Carp/
export BAT_THEME="gruvbox-dark"

. /home/zach/.nix-profile/etc/profile.d/nix.sh

# Functions
function nvim-closest() { nvim $(fd -p $@) }
function rgless () { rg "$@" --color always --column | less -r }
function clone() { git clone git@github.com:$1/$2.git && cd $2 }
function doppelganger() { PWD=$(pwd) "$TERM" & disown }
function gitignore () {
  curl https://raw.githubusercontent.com/github/gitignore/master/${(C)1}.gitignore > .gitignore
}

# Aliases
setopt complete_aliases

alias ssh="TERM=xterm-256color ssh"
alias pm="sudo pacman"
alias mocp="mocp ~/Music -T transparent-background"
alias mkalias="vim $HOME/.zshrc +"
alias music="udisksctl mount -b /dev/sda2 > /dev/null 2>&1; cd /run/media/zachchurchill/1AD2B07DD2B05EA7/music/; mocp -m"
alias youtube-audio="youtube-dl --extract-audio -f bestaudio --add-metadata --embed-thumbnail -o '%(autonumber)s.%(title)s.%(ext)s'"
alias neofetch="neofetch \
--block_range 1 14 \
--uptime_shorthand on \
--gtk_shorthand on \
--ascii_logo_size small \
--speed_shorthand on \
"
alias sudo="sudo -E"
alias gksudo="gksudo -k"
alias unrarall="fd -e rar -X unrar x -y {} \;"
alias unzipall="fd -e zip -X unzip {} \;"
alias unfolder="fd --min-depth 2 --type f --exec mv {} . \;"
alias listenmic="pw-loopback"
alias ds4="ds4drv --hidraw --led 000002"
alias flux="gammastep -O 5500 & disown"
alias unflux="killall gammastep"
alias weather="curl wttr.in/Norcross"
alias rampart="sudo mount -t tmpfs tmpfs /mnt -o size=1024m && cd /mnt"
alias vim="nvim"
alias cat="bat --paging never -p"
alias pingp='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="htop"
alias htop="TERM=xterm-256color htop"
alias tmux="tmux -f ~/.config/tmux.conf"
alias tmate="tmate -f ~/.config/tmux.conf"
alias dumpcore="cabal exec -- ghc-core --no-asm --no-cast"
alias hasktags="hasktags -c -R -x ."
