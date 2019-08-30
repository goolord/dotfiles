# directory of dotfiles
DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# link .config folder
ln -sf $DIR/.config/* $HOME/.config/

# make shell-scripts and link shell-scripts
mkdir $HOME/Dev/shell-scripts/; ln -sf $DIR/shell-scripts/* $HOME/Dev/shell-scripts/

ln -sf $DIR/.oh-my-zsh/custom/themes/* $HOME/.oh-my-zsh/custom/themes/
ln -sf $DIR/.oh-my-zsh/custom/plugins/* $HOME/.oh-my-zsh/custom/plugins/

ln -sf $DIR/.zshrc $HOME/

