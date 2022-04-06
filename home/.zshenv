# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

if [ -e /home/zach/.nix-profile/etc/profile.d/nix.sh ]; then . /home/zach/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
