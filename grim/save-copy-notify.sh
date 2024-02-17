#!/bin/bash

picturesPath=$(xdg-user-dir PICTURES)
dateFormat=$(date +%Y%m%d-%H%M%S)
filePath=$picturesPath"/Screenshots/"$dateFormat".png"
notifyPath=$(xdg-user-dir)"/.config/my-shared-config/grim/notify-screenshot.sh"

grim -g "$(slurp)" -t png $filePath &&
    wl-copy < $filePath &&
    $notifyPath $filePath 
