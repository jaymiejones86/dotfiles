# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  path+=(/opt/homebrew/opt/fzf/bin)
fi

# Auto-completion
# ---------------
[[ $- == *i* && -t 0 && -t 1 ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
[[ $- == *i* && -t 0 && -t 1 ]] && source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
