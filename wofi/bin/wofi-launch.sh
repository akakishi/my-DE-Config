#!/usr/bin/bash

wofi \
    --width 500 \
    --height 500 \
    --show drun \
    --hide-scroll \
    --insensitive \
    --define=allow_markup=true \
    --define=prompt=Search \
    --no-action
