#!/bin/bash

# This will load the Hyprland default config file.
hyprctl reload
notify-send "Setting performance perference."
powerprofilesctl set performance
