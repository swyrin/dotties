#!/bin/bash

set -euox pipefail
PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

# ------ Audio ------
$PACMAN {lib32-,}pipewire
$PACMAN wireplumber
$PACMAN pipewire-audio
$PACMAN pipewire-alsa
$PACMAN pipewire-pulse
$PACMAN {lib32-,}pipewire-jack
