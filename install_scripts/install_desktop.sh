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
$PACMAN waybar
$PACMAN sddm
$PARU   sddm-astronaut-theme
$PACMAN qt5-base qt5-quickcontrols2 qt5-svg
$PARU   hyprshade
