#!/bin/bash
xrandr --output HDMI-0 --same-as DP-3 &
nitrogen --restore &
picom &
nm-applet &
blueman-applet &
NetworkManager &
