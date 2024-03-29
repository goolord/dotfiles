if ! [ -d ~/Dev/shell-scripts ]
then
  mkdir -p ~/Dev/shell-scripts
  git clone git@github.com:goolord/shell-scripts.git ~/Dev/shell-scripts -q
fi

if ! [ -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim
  git clone git@github.com:goolord/nvim.git ~/.config/nvim -q
fi

yay -S $(cat aurpackages.txt) --needed --sudoloop
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
cabal install $(cat cabalpackages.txt) --overwrite-policy=always
cargo install $(cat cargopackages.txt)

if ! command -v zimfw 
then
  mkdir -p ~/.zim
  curl https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh > ~/.zim/zimfw.zsh 
  zsh ~/.zim/zimfw.zsh install
fi

systemctl enable greetd.service

./home.sh
./slash.sh
