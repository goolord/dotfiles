# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

if [ -e /home/zach/.nix-profile/etc/profile.d/nix.sh ]; then . /home/zach/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export EDITOR=nvim
export GDK_BACKEND=wayland

append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}
append_path '/home/zach/bin'
append_path '/home/zach/.local/share/bin'
append_path '/home/zach/.local/bin'
append_path '/home/zach/.ghcup/bin'
append_path '/home/zach/.cabal/bin'
append_path '/home/zach/.cargo/bin'
append_path '/home/zach/.luarocks/bin'

