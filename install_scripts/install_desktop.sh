#!/bin/bash

set -euox pipefail

PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

# Packages to make Hyprland functional
$PACMAN hyprland hyprland hyprlock hypridle hyprpaper hyprcursor
$PARU   hyprshot
$PACMAN xdg-desktop-portal
$PACMAN xdg-desktop-portal-hyprland
$PACMAN xdg-desktop-portal-gtk
$PACMAN polkit-gnome
$PARU   wlogout
$PACMAN waybar
$PACMAN sddm weston
$PARU   sddm-astronaut-theme
$PACMAN qt5-base qt5-quickcontrols2 qt5-svg
$PARU   hyprshade
$PARU   hyprpicker
$PACMAN papirus-icon-theme
$PARU   papirus-folders-catppuccin-git
$PACMAN power-profiles-daemon
$PARU   catppuccin-cursors-mocha
$PARU   catppuccin-gtk-theme-mocha
$PARU   lightly-kf{5,6}-git
$PACMAN qt{5,6}ct
$PACMAN qt{5,6}-wayland
$PACMAN libnotify mako
$PARU   eww
$PACMAN dex
$PACMAN xdg-user-dirs

# https://wiki.archlinux.org/title/XDG_user_directories#Creating_default_directories
LC_ALL=C.UTF-8 xdg-user-dirs-update --force

papirus-folders -C cat-mocha-pink --theme Papirus-Dark
