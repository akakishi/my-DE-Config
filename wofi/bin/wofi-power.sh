#!/usr/bin/env bash

cancel="<span foreground=\"#f38ba8\">󰜺</span> Cancel"
logout="󰍃 Logout"
lock="󱅞 Lock"
suspend="󰒲 Suspend"
reboot="󰜉 Reboot"
shutdown="󰐥 Shutdown"

entries="$cancel\n$logout\n$lock\n$suspend\n$reboot\n$shutdown"

selected=$(echo -e $entries | wofi \
    --width 250 \
    --height 450 \
    --lines 7 \
    --dmenu \
    --hide-scroll \
    --define=hide_search=true \
    --define=allow_markup=true \
    --cache-file /dev/null \
    --style ~/.config/my-shared-config/wofi/wofi-power.css \
    | awk '{print tolower($2)}')

case $selected in
    cancel)
        exit;;
    logout)
        swaymsg exit;;
    lock)
        exec swaylock -f;;
    suspend)
        exec loginctl suspend;;
    reboot)
        exec loginctl reboot;;
    shutdown)
        exec loginctl poweroff;;
esac
