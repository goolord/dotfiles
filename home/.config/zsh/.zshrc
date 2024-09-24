# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# source ${ZIM_HOME}/zim.zsh
if [[ -f ~/.nix-profile/lib/ah_aws.sh ]] then
  source ~/.nix-profile/lib/ah_aws.sh
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
export BAT_THEME="gruvbox-dark"
export MANPAGER="nvim +Man!"

# Functions
function nvim-closest() { nvim $(fd -p $@) }
function rgless() { rg "$@" --color always --column | less -r }
function clone() {
  name=(${(s;/;)1})
  git clone git@github.com:$1.git && cd "$name[2]"
}
function doppelganger() { PWD=$(pwd) "$TERM" & disown }
function bell() {
  if [ $? = 0 ];
  then (vlc --intf dummy ~/Dev/dotfiles/resources/audio/kh1.5/good.ogg vlc://quit &>/dev/null &)
  else (vlc --intf dummy ~/Dev/dotfiles/resources/audio/kh1.5/bad.ogg vlc://quit &>/dev/null &)
  fi
}

# function cabal_check() {
#   cabal build $@ -fno-code
# }

# Aliases
setopt complete_aliases

alias ssh="TERM=xterm-256color ssh"
alias mocp="mocp ~/Music -T transparent-background"
alias youtube-audio="youtube-dl --extract-audio -f bestaudio --add-metadata --embed-thumbnail -o '%(autonumber)s.%(title)s.%(ext)s'"
alias neofetch="neofetch \
--block_range 1 14 \
--uptime_shorthand on \
--gtk_shorthand on \
--ascii_logo_size small \
--speed_shorthand on \
"
alias unrarall="fd -e rar -X unrar x -y {} \;"
alias unzipall="fd -e zip -X unzip {} \;"
alias unfolder="fd --min-depth 2 --type f --exec mv {} . \;"
alias listenmic="pw-loopback"
alias ds4="ds4drv --hidraw --led 000002"
alias flux="gammastep -O 5500 & disown"
alias unflux="killall gammastep"
alias weather="curl wttr.in/Atlanta"
alias rampart="sudo mount -t tmpfs tmpfs /mnt -o size=1024m && cd /mnt"
alias vim="nvim"
alias cat="bat --paging never -p"
alias pingp='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="btm -bg"
alias tmux="tmux -f ~/.config/tmux.conf"
alias tmate="tmate -f ~/.config/tmux.conf"
alias dumpcore="cabal exec -- ghc-core --no-asm --no-cast"
alias loc="tokei"
alias ls="exa-wrapper.sh"
alias commitshit="git commit -am \"\$(curl 'whatthecommit.com/index.txt')\""
alias hasktags="ptags -c --languages=haskell"
alias aur="paru"
alias sudoe="sudo -E"
