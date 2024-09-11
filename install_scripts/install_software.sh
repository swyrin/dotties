#!/bin/bash

set -euox pipefail
PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

$PACMAN mako				                # --- libappnotify-compliant notification daemon
$PACMAN waybar				                # --- the bar 
$PACMAN alacritty        		            # --- terminal emulator
$PACMAN rofi-wayland     		            # --- application launcher
$PARU   bemoji                              # --- emoji picker for rofi
$PARU   cliphist wtype                      # --- clipboard history for rofi
$PACMAN fcitx5{,-unikey}		            # --- input method (plus I am from 'nam)
$PACMAN network-manager-applet	            # --- tray icon for networkmanager
$PACMAN playerctl			                # --- CLI tool for controlling MPRIS-compliant media
$PACMAN pamixer				                # --- CLI tool for controlling audio
$PACMAN pavucontrol			                # --- GUI tool for controlling audio
$PACMAN wlsunset   			                # --- shut up blue light
$PACMAN btop 				                # --- think like task manager
$PACMAN zsh				                    # --- z shell
$PARU   zsh-theme-powerlevel10k-bin-git     # --- z shell but on steroid
$PARU   ttf-meslo-nerd-font-powerlevel10k   # --- PL10k recommended font
$PACMAN zsh-completions			            # --- z shell completions
$PACMAN zsh-autosuggestions                 # --- z shell suggestions
$PACMAN zsh-syntax-highlighting             # --- z shell syntax highlighting
$PACMAN zsh-history-substring-search        # --- z shell command hint based on history
$PACMAN fastfetch                           # --- system fetch
$PACMAN alsa-utils                          # --- CLI tool for controlling audio, but works closely with Linux
$PACMAN brightnessctl                       # --- CLI tool for controlling brightness
$PACMAN powerline-fonts                     # --- powerline fonts
$PACMAN fzf                                 # --- (f)u(z)zy (f)inder
$PACMAN pkgfile                             # --- Arch repo package lookup 
$PARU   oh-my-zsh-git                       # --- oh my zsh for powerlevel10k
