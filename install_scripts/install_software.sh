#!/bin/bash

set -euox pipefail
PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

$PACMAN nwg-look                                    # --- GTK theme configuration
$PACMAN gnome-keyring libsecret libgnome-keyring	# --- GNOME keyring
$PACMAN nautilus					                # --- GNOME Files
$PACMAN file-roller					                # --- GNOME archive manager
$PACMAN seahorse					                # --- GNOME secret manager
$PACMAN firefox						                # --- Browser
$PACMAN btop						                # --- Task manager but on steroid
$PACMAN network-manager-applet				        # --- NM tray icon
$PACMAN alacritty        		                    # --- terminal emulator
$PACMAN rofi-wayland     		                    # --- application launcher
$PARU   rofimoji                                	# --- emoji picker for rofi
$PARU   cliphist wtype                          	# --- clipboard history for nwg-clipman
$PACMAN nwg-clipman                             	# --- clipboard manager
$PACMAN playerctl			                        # --- CLI tool for controlling MPRIS-compliant media
$PACMAN pamixer				                        # --- CLI tool for controlling audio
$PACMAN pavucontrol			                        # --- GUI tool for controlling audio
$PACMAN zsh				                            # --- z shell
$PARU   zsh-theme-powerlevel10k-git             	# --- z shell but on steroid
$PARU   ttf-meslo-nerd-font-powerlevel10k       	# --- PL10k recommended font
$PACMAN zsh-completions			                    # --- z shell completions on tab
$PACMAN zsh-autosuggestions                     	# --- z shell suggestions (as a shadow text)
$PACMAN zsh-syntax-highlighting                 	# --- z shell syntax highlighting
$PACMAN zsh-history-substring-search            	# --- z shell command hint based on history
$PACMAN fastfetch                               	# --- system fetch
$PACMAN alsa-utils                              	# --- CLI tool for controlling audio, but works closely with Linux
$PACMAN brightnessctl                           	# --- CLI tool for controlling brightness
$PACMAN powerline-fonts                         	# --- powerline fonts
$PACMAN fzf                                     	# --- (f)u(z)zy (f)inder
$PACMAN pkgfile                                 	# --- Arch repo package lookup
$PARU   oh-my-zsh-git                           	# --- oh my zsh for powerlevel10k
$PARU   spoofdpi-bin                            	# --- DPI spoofer
$PACMAN nano						                # --- simple editor runs on terminal
$PARU 	nano-syntax-highlighting-git			    # --- nano syntax highlighting
