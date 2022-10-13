#!/bin/bash

while true; do
    PERC=$(( $(acpi | awk -F, '{print $2}' | sed 's/%//g') ))
    if [[ $PERC -le 5 ]]
    then
        notify-send "Battery" "Low battery!" --expire-time=1000
        brightnessctl set 15%
    fi;
    sleep 5
done;
