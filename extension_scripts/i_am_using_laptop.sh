#!/bin/bash

set -euox pipefail
PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

$PACMAN upower

# Setup battery saving "bloatwares"
# This will be triggered when you are using "laptop", or anything that uses battery.
if ! [ -z $(upower -e | grep battery) ];
then
    # Powertop
    $PACMAN powertop
    sudo cp $DOTTIES_DIR/.config/systemd/system/powertop.service /etc/systemd/system/powertop.service
    $SYSCTL_ENABLE powertop.service

    # ACPI for laptop-mode-tools
    $PACMAN acpid
    $SYSCTL_ENABLE acpid.service

    # laptop-mode-tools
    $PARU laptop-mode-tools ethtool iw hdparm sdparm hal bluez-utils
    $SYSCTL_ENABLE laptop-mode.service

    # thermald
    $PACMAN thermald
    $SYSCTL_ENABLE thermald.service

    # auto-cpufreq
    $PARU auto-cpufreq
    $SYSCTL_ENABLE auto-cpufreq.service

    # battery icon
    $PACMAN cbatticon
else
    # If this is useless, why bother having it?
    $PACMAN_YEET upower
fi
