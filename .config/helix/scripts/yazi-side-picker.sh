#!/usr/bin/env bash

zellij action move-pane left

while true; do
    paths=$(yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

    if [[ -n "$paths" ]]; then
        zellij action focus-next-pane
        zellij action write 27 # send <Escape> key
        zellij action write-chars ":open $paths"
        zellij action write 13 # send <Enter> key
        zellij action focus-previous-pane
    fi
done
