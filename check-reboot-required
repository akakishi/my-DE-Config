#!/usr/bin/bash

s1=$(yay -Q linux | sed 's/linux //')
s2=$(uname -r | sed 's/-ARCH//')

if [ "$s1" = "$s2" ]; then
    json='{"text": ""}'
    echo "$json"
else
    json='{"text": " 󱄌 ", "tooltip": "Restart required.", "class": "critical", "percentage": 1}'
    echo "$json"
fi
