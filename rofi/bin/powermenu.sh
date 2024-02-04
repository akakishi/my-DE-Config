#!/usr/bin/env bash

rofi_command="rofi -theme $HOME/.config/rofi/config/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
cancel="󰜺 Cancel"
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
logout=" Logout"
ddir="$HOME/.config/rofi/config"

# Variable passed to rofi
options="$cancel\n$lock\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
    $cancel)
        exit
        ;;
    $lock)
        swaylock -f
        ;;
        # sh $HOME/.local/bin/lock
        # ;;
    $logout)
		hyprtcl dispatch exit
        ;;
    $reboot)
		systemctl reboot
        ;;
    $shutdown)
		systemctl poweroff
		;;
esac
