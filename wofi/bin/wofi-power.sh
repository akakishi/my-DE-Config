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
    --location=top_right \
    --xoffset=-20 \
    --allow_markup \
    --cache-file /dev/null \
    | awk '{print tolower($2)}')

case $selected in
    cancel)
        exit;;
    logout)
        hyprctl dispatch exit;;
    lock)
        exec swaylock -f;;
    suspend)
        exec systemctl suspend;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff;;
esac
