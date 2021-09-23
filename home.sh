# directory of dotfiles
DIR="$( { cd "$(dirname "$0")" || exit; } ; pwd -P )"

stow home -d "$DIR" -t ~/
