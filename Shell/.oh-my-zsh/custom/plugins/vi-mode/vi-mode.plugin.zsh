# Ensures that $terminfo values are valid and updates editor information when
# the keymap changes.
function zle-keymap-select zle-line-init zle-line-finish {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

POWERLINE_COLOR_FG_BLUE=%F{blue}
POWERLINE_COLOR_BG_BLUE=%K{blue}
POWERLINE_COLOR_FG_GREEN=%F{green}
POWERLINE_COLOR_BG_GREEN=%K{green}
POWERLINE_COLOR_FG_WHITE=%F{white}
POWERLINE_COLOR_FG_BLACK=%F{black}

  NORMAL_MODE="$POWERLINE_COLOR_FG_BLUE\u2b82%f$POWERLINE_COLOR_BG_BLUE$POWERLINE_COLOR_FG_WHITE NORMAL "

  INSERT_MODE="$POWERLINE_COLOR_FG_GREEN\u2b82%f$POWERLINE_COLOR_BG_GREEN$POWERLINE_COLOR_FG_BLACK INSERT "

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$NORMAL_MODE}/(main|viins)/$INSERT_MODE}"
}
