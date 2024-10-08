#!/bin/bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

notify-send "Setting power-saver preference."
powerprofilesctl set power-saver

hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword misc:vfr 0;\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur:enabled 0;\
    keyword general:border_size 1;\
    keyword decoration:rounding 0"
