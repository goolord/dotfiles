#!/bin/sh

ACTION=`zenity --width=90 --height=250 --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE Shutdown FALSE Reboot FALSE LockScreen FALSE LogOut FALSE Suspend`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    zenity --question --text "Are you sure you want to halt?" && i3exit shutdown
    ;;
  Reboot)
    zenity --question --text "Are you sure you want to reboot?" && i3exit reboot
    ;;
  Suspend)
    i3exit suspend
    ;;
  LogOut)
    i3exit logout
    ;;
  LockScreen)
    i3exit lock
    ;;
  esac
fi
