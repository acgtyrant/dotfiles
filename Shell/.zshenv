# Making your BASH history more efficient
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
export HISTCONTROL="ignoreboth"
export HISTSIZE=10000

# ArchWiki: Environment Viriables
# https://wiki.archlinux.org/index.php/Environment_variables#Examples
# How are “xterm” and “screen” related?
# http://unix.stackexchange.com/questions/140139/how-are-xterm-and-screen-related
export TERM="screen"
export TERMINFO="$HOME/.terminfo"
# Note that some variables may be full pathnames.
# https://github.com/mobile-shell/mosh/issues/722#issuecomment-176266421
export SHELL="/usr/bin/zsh"
export PAGER="/usr/bin/vimpager"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export XDG_CONFIG_HOME="$HOME/.config"
# These addresses are assigned by cow.
proxy () {
  export http_proxy="http://127.0.0.1:7779"
  export https_proxy="http://127.0.0.1:7779"
  export HTTP_PROXY="http://127.0.0.1:7779"
  export HTTPS_PROXY="http://127.0.0.1:7779"
  echo "http proxy on"
}
noproxy () {
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  echo "http proxy off"
}

# Choose Default Qt toolkit
# https://wiki.archlinux.org/index.php/Qt#Using_environment_variables
export QT_SELECT=5

# Docker cli ignores environment variable http_proxy
# https://github.com/docker/docker/issues/10224
export no_proxy="/var/run/docker.sock"

# Convert a virtual big screen to two screens for SDL game.
# https://wiki.archlinux.org/index.php/NVIDIA#Gaming_using_TwinView
export SDL_VIDEO_FULLSCREEN_HEAD=1

# https://github.com/lilydjwg/search-and-view
export AGV_EDITOR="/bin/gvim"

# gperftools result position.
# See https://github.com/gperftools/gperftools/blob/master/README
export CPUPROFILE=$HOME/tmp/gperf.out

# CHROOT
# https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot#Setting_Up_A_Chroot
export CHROOT=$HOME/chroot

# Java font.
# https://wiki.archlinux.org/index.php/Java#Better_font_rendering
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# Development needs.
export CAFFE_DIR="${HOME}/Projects/caffe"
PATH="${CAFFE_DIR}/build/tools:$PATH"
PATH="/usr/local/cuda/bin:$PATH"  # for Ubuntu cuda
export RP_DIR="${HOME}/Projects/RoadPerception"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH"

# PATH
PATH="${HOME}/.local/bin:$PATH"

# remove duplicated value in PATH
typeset -U PATH
export PATH
