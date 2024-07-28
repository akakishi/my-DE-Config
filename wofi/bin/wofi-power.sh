#!/usr/bin/env bash

cancel="Cancel"
logout="Logout"
lock="Lock"
suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"

entries="$cancel\n$logout\n$lock\n$suspend\n$reboot\n$shutdown"

selected=$(echo -e $entries | wofi \
    --width 250 \
    --lines 9 \
    --columns 1 \
    --show=dmenu \
    --hide-scroll \
    --define=hide_search=true \
    --define=prompt=Search \
    --allow_markup \
    --cache-file /dev/null \
    -s ~/.config/wofi/style-no-search.css \
    | awk '{print tolower($1)}')

case $selected in
    cancel)
        exit;;
    logout)
        hyprctl dispatch exit;;
    lock)
        hyprlock;;
    suspend)
        systemctl suspend;;
    reboot)
        systemctl reboot;;
    shutdown)
        systemctl poweroff;;
esac
