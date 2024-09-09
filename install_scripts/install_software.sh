#!/bin/bash

set -euox pipefail
PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

$PACMAN mako				    # --- libappnotify-compliant notification daemon
$PACMAN waybar				    # --- the bar 
$PACMAN alacritty        		# --- terminal emulator
$PACMAN rofi-wayland     		# --- application launcher
$PACMAN fcitx5{,-unikey}		# --- input method (plus I am from 'nam)
$PACMAN network-manager-applet	# --- tray icon for networkmanager
$PACMAN playerctl			    # --- CLI tool for controlling MPRIS-compliant media
$PACMAN pamixer				    # --- CLI tool for controlling audio
$PACMAN pavucontrol			    # --- GUI tool for controlling audio
$PACMAN gammastep			    # --- shut up blue light
$PACMAN firefox				    # --- the browser
$PACMAN btop 				    # --- think like task manager
$PACMAN zsh				        # --- z shell
$PACMAN zsh-theme-powerlevel10k	# --- z shell but on steroid
$PACMAN zsh-completions			# --- yes?
$PACMAN uwufetch                # --- system fetch
$PACMAN alsa-utils              # --- CLI tool for controlling audio, but works closely with Linux
