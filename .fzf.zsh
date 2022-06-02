# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
