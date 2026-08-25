#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != Linux ]]; then
  echo "grub.sh is Linux only." >&2
  exit 1
fi

sudo grub-mkconfig -o /boot/grub/grub.cfg
