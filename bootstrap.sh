if ! [ -d ~/Dev/shell-scripts ]
then
  mkdir -p ~/Dev/shell-scripts
  git clone git@github.com:goolord/shell-scripts.git ~/Dev/shell-scripts -q
fi

if ! command -v zimfw 
then
  mkdir -p ~/.zim
  curl https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh > ~/.zim/zimfw.zsh 
  zsh ~/.zim/zimfw.zsh install
fi

