# FreeAgent puts the powerline style in zsh !

GIT_DIRTY_COLOR=%F{red}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX=" "
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
%k%f%F{green}%K{blue}"$''" \
%k%f%F{white}%K{blue}%m \
%k%f%F{blue}%K{magenta}"$''" \
%f%F{white}%~ "$'$(git_prompt_info)'"\
%k%f%F{magenta}"$''"
%k%f%F{red}$ %f"

RPROMPT=%k%f%F{white}''%k%f%F{black}%K{white}"%D{%H:%M:%S} "
