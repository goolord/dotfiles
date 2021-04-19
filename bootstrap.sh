if [ -d ~/Dev/shell-scripts ]
  then 
    :
  else 
    mkdir -p ~/Dev/shell-scripts
    git clone git@github.com:goolord/shell-scripts.git ~/Dev/shell-scripts -q
fi

if [ -d ~/.zim ] 
  then
    :
  else
    mkdir -p ~/.zim
    curl https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh > ~/.zim/zimfw.zsh 
    zsh ~/.zim/zimfw.zsh install
fi

