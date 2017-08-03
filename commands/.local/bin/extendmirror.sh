#!/bin/bash
xrandr --output eDP1 --mode 1366x768 --output HDMI1 --mode 1920x1080 --right-of eDP1
xrandr --output HDMI1 --primary
feh --bg-fill '/home/acgtyrant/background'
