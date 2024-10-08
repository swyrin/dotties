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
$PACMAN {lib32-,}jack2

# ------ AMDGPU ------
$PACMAN {lib32-,}mesa
$PACMAN {lib32-,}vulkan-radeon
$PACMAN {lib32-,}libva-mesa-driver
$PACMAN {lib32-,}mesa-vdpau
$PACMAN xf86-video-amdgpu
