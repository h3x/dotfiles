#!/bin/bash
xrandr --output HDMI-0 --same-as DP-3 &
nitrogen --restore &
picom &
dunst &
nm-applet &
blueman-applet &
NetworkManager &
QT_AUTO_SCREEN_SCALE_FACTOR=1 zoom&
