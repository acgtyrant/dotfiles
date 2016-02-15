# use as basic shell
export PATH="$PATH:~/bin"
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S"
export EDITOR="/bin/vim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# some basic aliases
alias l='ls --color=auto'
alias ll='ls -alFh --color=auto'
alias vi='vim'
alias grep='grep --color'
