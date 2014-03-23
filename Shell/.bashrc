#
# ~/.bashrc
#

export PATH=$PATH:~/bin
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S"
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls --color=auto'
alias ll='ls -alFh --color=auto'
alias vi='vim'
alias grep='grep --color'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Added by Canopy installer on 2013-10-27
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /home/acgtyrant/Enthought/Canopy_32bit/User/bin/activate

# Added by Canopy installer on 2014-03-09
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /home/acgtyrant/Enthought/Canopy_64bit/User/bin/activate
