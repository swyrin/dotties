#!/bin/bash

set -euox pipefail

PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

# Packages to make Hyprland functional
$PACMAN hyprland hyprland hyprlock hypridle hyprpaper hyprcursor
$PARU   hyprshot
$PACMAN xdg-desktop-portal-hyprland
$PACMAN polkit-kde-agent
$PARU   wlogout
$PACMAN waybar
$PACMAN sddm kwin layer-shell-qt{,5}
$PARU   sddm-astronaut-theme
$PACMAN qt5-base qt5-quickcontrols2 qt5-svg
$PARU   hyprshade
$PARU   hyprpicker
