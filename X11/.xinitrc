#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export LC_CTYPE="zh_CN.UTF-8"

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec awesome
exec i3
