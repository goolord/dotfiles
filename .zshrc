# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ysn"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"



# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-zsh
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export NIX_PATH="${NIX_PATH:+$NIX_PATH:}nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs"

#export PATH="$PATH:$HOME/.nix-profile/bin:/home/zach/bin:~/.local/bin"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ssh="export TERM=xterm-256color && ssh"
alias pm="sudo pacman"
alias mocp="mocp -T transparent-background"
alias makealias="vim $HOME/.zshrc"
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
alias unzipall="find ./ -name \*.rar -exec unrar -Z -o  {} \;"
alias unfolder="find . -mindepth 2 -type f -print -exec mv {} . \;"
alias listenmic="pactl load-module module-loopback latency_msec=200"
alias unlistenmic="pactl unload-module module-loopback"
alias emacscli="emacs -nw"
alias ds4="ds4drv --hidraw --led 000002"
alias srgb="xgamma -g .85"
alias flux="redshift -O 4250"
alias weather="curl wttr.in/Norcross"
alias rampart="sudo mount -t tmpfs tmpfs /mnt -o size=1024m && cd /mnt"
alias nixp="nix-env"
alias snr='nix-repl "<nixpkgs>"'
alias vim="nvim"
alias bat="bat --paging never"
alias cat="bat --paging never -p"
alias pingp='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in vim
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
alias top="htop"

#transfer
alias transfer="~/Documents/shell-scripts/transfer.sh"
