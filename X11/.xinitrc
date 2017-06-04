#!/bin/sh

# Start the gnome-keyring-daemon from xinitrc
# https://wiki.archlinux.org/index.php/GNOME/Keyring#xinitrc_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# With GDM, XDM, KDM or LightDM there is no need to source ~/.Xmodmap
# https://wiki.archlinux.org/index.php/Xmodmap
[[ -s ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Merge Xresources automatically
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set Fcitx as IME
# https://wiki.archlinux.org/index.php/Fcitx_(简体中文)#.E9.9D.9E.E6.A1.8C.E9.9D.A2.E7.8E.AF.E5.A2.83
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export LC_CTYPE="zh_CN.UTF-8"

# https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup#startx
numlockx &

# Executed by startx (run your window manager from here)
exec i3
