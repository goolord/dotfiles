# directory of dotfiles
DIR=$(dirname $0)

# link .config folder
ln -sf $DIR/.config/* $HOME/.config/

# make shell-scripts and link shell-scripts
mkdir $HOME/Documents/shell-scripts/; ln -sf $DIR/shell-scripts/* $HOME/Documents/shell-scripts/

# SpaceVim config
mkdir $HOME/.SpaceVim.d/; ln -sf $DIR/.SpaceVim.d/* $HOME/.SpaceVim.d/

ln -sf $DIR/.oh-my-zsh/* $HOME/.oh-my-zsh/

ln -sf $DIR/.zshrc $HOME/

ln -sf $DIR/init.vim $HOME/.config/nvim/init.vim

ln -sf $DIR/init.vim $HOME/.SpaceVim/init.vim
