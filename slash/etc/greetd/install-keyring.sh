#!/bin/sh
# Run once with: sudo ./slash/etc/greetd/install-keyring.sh
set -e
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
install -m644 "$ROOT/slash/etc/pam.d/greetd" /etc/pam.d/greetd
install -m755 "$ROOT/slash/etc/greetd/start-sway" /etc/greetd/environments/start-sway
# keep repo environments/ copy in sync (root-owned dir)
install -m755 "$ROOT/slash/etc/greetd/start-sway" "$ROOT/slash/etc/greetd/environments/start-sway"
echo "greetd PAM + start-sway installed. Relogin for unlock + SSH_AUTH_SOCK."
