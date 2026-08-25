#!/usr/bin/env bash
set -euo pipefail

stow_conflicts() {
  stow_command "$@" -n 2>&1 \
    | rg ".*\* cannot stow .* over existing target ([^ ]+/[^ ]+?) since .*" -r '$1' \
    || true
}

remove_conflicts() {
  local target
  local -a rm_cmd=(rm -rf)
  [[ -n "${STOW_SUDO:-}" ]] && rm_cmd=(sudo rm -rf)

  for target in "$@"; do
    [[ -n "$target" ]] || continue
    echo "Replacing conflicting target: $target" >&2
    "${rm_cmd[@]}" "$target"
  done
}

case ${1:-} in
  --skip-existing)
    shift
    mapfile -t RES < <(stow_conflicts "$@")
    if ((${#RES[@]})); then
      IGNORE_REGEX=$(printf "%s|" "${RES[@]}")
      IGNORE_REGEX="${IGNORE_REGEX%?}"
      stow_command "$@" --ignore="$IGNORE_REGEX"
    else
      stow_command "$@"
    fi
    ;;
  *)
    while true; do
      mapfile -t RES < <(stow_conflicts "$@")
      ((${#RES[@]})) || break
      remove_conflicts "${RES[@]}"
    done
    stow_command "$@"
    ;;
esac
