# directory of dotfiles
DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# link .config folder
ln -sf $DIR/.config/* $HOME/.config/

# make shell-scripts and link shell-scripts
mkdir $HOME/Documents/shell-scripts/; ln -sf $DIR/shell-scripts/* $HOME/Documents/shell-scripts/

# SpaceVim config
mkdir $HOME/.SpaceVim.d/; ln -sf $DIR/.SpaceVim.d/* $HOME/.SpaceVim.d/

ln -sf $DIR/.oh-my-zsh/custom/themes/* $HOME/.oh-my-zsh/custom/themes/
ln -sf $DIR/.oh-my-zsh/custom/plugins/* $HOME/.oh-my-zsh/custom/plugins/

ln -sf $DIR/.zshrc $HOME/

ln -sf $DIR/init.vim $HOME/.config/nvim/init.vim

ln -sf $DIR/init.vim $HOME/.SpaceVim/init.vim
