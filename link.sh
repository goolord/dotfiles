# directory of dotfiles
DIR="$( { cd "$(dirname "$0")" || exit; } ; pwd -P )"

alias linkcontents="cp -ansv"
alias link="ln -sfvn"

link "$DIR"/.config/* "$HOME"/.config

# shell scripts
function shellScripts() {
  if [ -d ~/Dev/shell-scripts ]
  then 
    mkdir -p ~/Dev/shell-scripts
    cd ~/Dev/shell-scripts && git pull
  else 
    git clone git@github.com:goolord/shell-scripts.git ~/Dev/shell-scripts -q
  fi
}
printf "%s" "shell-scripts: "
if shellScripts; then exit 1; else cd "$DIR" || exit; fi

# zsh
linkcontents "$DIR"/.oh-my-zsh/ "$HOME"/.oh-my-zsh/
link "$DIR"/.zshrc "$HOME"/.zshrc

# git
link "$DIR"/.gitconfig "$HOME/"

