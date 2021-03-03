# directory of dotfiles
DIR="$( { cd "$(dirname "$0")" || exit; } ; pwd -P )"

stow home -d "$DIR" -t ~/

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
if shellScripts; then echo 'done'; else cd "$DIR" || exit; fi

