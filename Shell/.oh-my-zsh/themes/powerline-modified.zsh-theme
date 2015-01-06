# FreeAgent puts the powerline style in zsh !


POWERLINE_COLOR_BG_GRAY=%K{240}
POWERLINE_COLOR_BG_LIGHT_GRAY=%K{240}
POWERLINE_COLOR_BG_WHITE=%K{255}

POWERLINE_COLOR_FG_GRAY=%F{240}
POWERLINE_COLOR_FG_LIGHT_GRAY=%F{240}
POWERLINE_COLOR_FG_WHITE=%F{255}

GIT_DIRTY_COLOR=%F{red}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX="\u2b60 "
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✘ "
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✔ "

ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

PROMPT="
%k%f%F{blue}# \
%k%f%F{white}%K{green} %n \
%k%f%F{green}%K{blue}"$'\u2b80'" \
%k%f%F{white}%K{blue}%m \
%k%f%F{blue}%K{magenta}"$'\u2b80'" \
%f%F{white}%~ "$'$(git_prompt_info)'"\
%k%f%F{magenta}"$'\u2b80'"
%k%f%F{red}$ %f"

RPROMPT=$POWERLINE_COLOR_FG_WHITE$'\u2b82'"%f$POWERLINE_COLOR_BG_WHITE $POWERLINE_COLOR_FG_GRAY%D{%H:%M:%S} "
