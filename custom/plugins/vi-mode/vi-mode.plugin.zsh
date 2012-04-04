function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

# Use vi mode, but modify backspace so it still works in insert mode.
bindkey -M viins '' backward-delete-char
bindkey -M viins '' backward-delete-char
bindkey '[1~' beginning-of-line
bindkey '[4~' end-of-line

# Further modify vi mode so Ctrl+P and Ctrl+N move through history.
bindkey -M viins '' up-history
bindkey -M viins '' down-history

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
