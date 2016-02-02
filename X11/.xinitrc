#!/bin/sh

# https://wiki.archlinux.org/index.php/Xmodmap
[[ -s ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# https://wiki.archlinux.org/index.php/X_resources#Adding_to_xinitrc
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set Fcitx as IME
# https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E9.9D.9E.E6.A1.8C.E9.9D.A2.E7.8E.AF.E5.A2.83
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export LC_CTYPE="zh_CN.UTF-8"

# https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup#startx
numlockx &

# Executed by startx (run your window manager from here)
exec i3
