# directory of dotfiles
DIR="$( { cd "$(dirname "$0")" || exit; } ; pwd -P )"

sudo stow slash -d "$DIR" -t /
