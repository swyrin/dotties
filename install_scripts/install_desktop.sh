#!/bin/bash

set -euox pipefail

PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

# Packages to make Hyprland functional
$PACMAN hyprland hyprland hyprlock hypridle hyprpaper
$PARU   hyprshot
$PACMAN xdg-desktop-portal-hyprland
$PACMAN polkit-kde-agent
$PARU   wlogout
