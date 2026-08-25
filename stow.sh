#!/usr/bin/env bash
set -euo pipefail

# Paths stow reports relative to TARGET_DIR (usually ~).
conflict_target() {
  local target=$1
  if [[ "$target" = /* ]]; then
    printf '%s\n' "$target"
  else
    printf '%s/%s\n' "${TARGET_DIR%/}" "$target"
  fi
}

stow_conflicts() {
  local output
  output=$(stow_command "$@" -n 2>&1) || true
  {
    printf '%s\n' "$output" \
      | rg 'existing target is not owned by stow: (.+)$' -or '$1' || true
    printf '%s\n' "$output" \
      | rg 'cannot stow .* over existing target ([^ ]+) since' -or '$1' || true
  } | sort -u
}

remove_conflicts() {
  local target resolved
  local -a rm_cmd=(rm -rf)
  [[ -n "${STOW_SUDO:-}" ]] && rm_cmd=(sudo rm -rf)

  for target in "$@"; do
    [[ -n "$target" ]] || continue
    resolved="$(conflict_target "$target")"
    echo "Replacing conflicting target: $resolved" >&2
    "${rm_cmd[@]}" "$resolved"
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
