# open_in_helix_from_yazi.zsh
file=$(yazi --chooser-file=/dev/stdout | cat)
# echo $file
zellij action toggle-floating-panes
zellij action write 27 # send escape-key
zellij action write-chars ":open $(command printf '%q' "$file")"
zellij action write 13 # send enter-key
zellij action toggle-floating-panes
zellij action close-pane

