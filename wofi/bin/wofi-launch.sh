#!/usr/bin/bash

wofi \
    --width 500 \
    --height 750 \
    --lines 12 \
    --show drun \
    --hide-scroll \
    --insensitive \
    --define=allow_markup=true \
    --style ~/.config/my-shared-config/wofi/wofi-launch.css
