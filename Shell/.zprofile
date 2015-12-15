# only fot startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
