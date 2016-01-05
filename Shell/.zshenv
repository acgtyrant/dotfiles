# Making your BASH history more efficient
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
export HISTCONTROL="ignoreboth"
export HISTSIZE=10000

# ArchWiki: Environment Viriables
# https://wiki.archlinux.org/index.php/Environment_variables#Examples
export TERM="xterm-256color"
export SHELL="zsh"
export PAGER="vimpager"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="google-chrome-stable"
export XDG_CONFIG_HOME="$HOME/.config"
# These addresses are assigned by cow.
export http_proxy="http://127.0.0.1:7777"
export https_proxy="http://127.0.0.1:7777"
export HTTP_PROXY="http://127.0.0.1:7777"
export HTTPS_PROXY="http://127.0.0.1:7777"

# Docker cli ignores environment variable http_proxy
# https://github.com/docker/docker/issues/10224
export no_proxy="/var/run/docker.sock"

# More PATH! More PATH! More PATH!
export PATH="$HOME/bin:$PATH"
typeset -U PATH # ...And let any duplicate varaibles go!

# https://github.com/lilydjwg/search-and-view
export AGV_EDITOR=gvim

#Convert a virtual big screen to two screens for SDL game.
export SDL_VIDEO_FULLSCREEN_HEAD=1

# Choose Default Qt toolkit
# https://wiki.archlinux.org/index.php/Qt#Using_environment_variables
export QT_SELECT=5

# Caffe development needs.
export CAFFE_DIR="${HOME}/Projects/caffe"
export PYTHONPATH="${CAFFE_DIR}/distribute/python/"
export LD_LIBRARY_PATH="${CAFFE_DIR}/distribute/lib/"
