#!/bin/zsh
trap 'kill 0' SIGINT;\
  (git pull) &\
  (cd ~/Dev/shell-scripts && git pull) &\
  (cd ~/.config/nvim && git pull)\

wait
