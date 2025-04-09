# directory of dotfiles
export DIR="$( { cd "$(dirname "$0")" || exit; } ; pwd -P )"
export TARGET_DIR=~/

function stow_command() {
  stow home -d "$DIR" -t $TARGET_DIR $@
}

export -f stow_command

$DIR/stow.sh $@
