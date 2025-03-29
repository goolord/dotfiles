case $1 in
  --skip-existing)
    shift
    IFS=$'\n'
    RES=($(stow_command $@ -n 2>&1 | rg ".*\* cannot stow .* over existing target ([^ ]+/[^ ]+?) since .*" -r "\$1"))
    IGNORE_REGEX=$(printf "%s|" "${RES[@]}")
    IGNORE_REGEX="${IGNORE_REGEX%?}"
    stow_command $@ --ignore="$IGNORE_REGEX"
    ;;
  *)
    stow_command $@
    ;;
esac
