#!/bin/bash

filePath=$1

if [[ -z $filePath ]]; then
    echo "empty path"
    exit
fi

open_image () {
    gthumb $filePath
}
delete_image () {
    if [[ -f $filePath ]]; then
        rm $filePath
    else
        echo "File does not exist."
    fi
}

action=$(dunstify -i $filePath \
    --action="open,Open image" \
    --action="delete,Delete" "Screenshot Ready")

case "$action" in
    "open")
        open_image
        ;;
    "delete")
        delete_image
        ;;
esac
