#!/usr/bin/env bash

wofi \
    --width 500 \
    --height 750 \
    --lines 12 \
    --show drun \
    --hide-scroll \
    --define=allow_markup=true \
    --cache-file /dev/null \
    --style ~/.config/my-shared-config/wofi-launch.css \
