#!/usr/bin/env zsh
trap 'kill 0' SIGINT

pids=()
(git pull) & pids+=($!)
[[ -d ~/Dev/shell-scripts ]] && (cd ~/Dev/shell-scripts && git pull) & pids+=($!)
[[ -d ~/.config/nvim ]] && (cd ~/.config/nvim && git pull) & pids+=($!)

status=0
for pid in $pids; do
  wait $pid || status=1
done

exit $status
