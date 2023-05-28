#!/bin/bash

alayadev = "$HOME/dev/alaya"
declare -a options=(
"api.accounting"
"webapp"
"phpapp"
)

choice = $(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Api')

if [$choice = "quit"]; then
    exit
fi


if [ $choice = 'phpapp']; then
  phpstorm $alayadev/$choice &
else
  pycharm-professional $alayadev/$choice &
fi
