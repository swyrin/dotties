#!/bin/sh
eww="eww -c $HOME/.config/eww/"

$eww close calendar || (\
    $eww update day=$(date +"%d"); \
    $eww update month=$(date +"%m"); \
    $eww update year=$(date +"%Y"); \
    $eww open calendar )
