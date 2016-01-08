# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="ys"
ZSH_THEME="tyrant"

# Make man pages colored
man() {
  env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=10

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(systemd archlinux github)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv
source /usr/share/doc/pkgfile/command-not-found.zsh

# Customize to your needs...

# Example aliases
alias l='ls --color=auto'
alias vi='vim'
alias cl='clang'
alias gv='gvim'

alias sw='sudo wifi-menu'
alias git=hub
alias less=vimpager

alias ssh='ssh -Y'
alias ll='ls -alFh --color=auto'
alias grep='grep --color'
alias rm=' rm -Iv --one-file-system'
alias mkdir='mkdir -pv'
alias dstat='dstat -cdlmnpsy'
alias gvim='gvim -p'
alias wps='wps -style gtk'
alias et='et -style gtk'
alias wpp='wpp -style gtk'

# Improve colored output by ls
eval "$(dircolors -b)"

# source some files
[[ -s /etc/profile.d/autojump.sh  ]] && source /etc/profile.d/autojump.sh
