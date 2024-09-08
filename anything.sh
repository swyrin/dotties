#!/bin/bash

set -e
set -u
set -o pipefail
set -x

# ------- Arch with Hyprland install script -------
# DO NOT BLINDLY RUN THIS FILE!!!!
#
# This is just my autoinstall when I (re)install Arch!
# This will run well on:
# - My machine <3
# - Arch Linux (and derivates)
#
#
#
# !!! MAKE SURE YOU PROPERLY INSTALLED ARCH !!!
# https://wiki.archlinux.org/title/Installation_guide

# Save current directory
THIS_PLACE=$(pwd)

# Configure pacman
. $THIS_PLACE/install_scripts/configure_pacman.sh

# Install paru
. $THIS_PLACE/install_scripts/install_aur_helper.sh

# Install packages (base desktop -> system -> software)
. $THIS_PLACE/install_scripts/install_desktop.sh
. $THIS_PLACE/install_scripts/install_system.sh
. $THIS_PLACE/install_scripts/install_software.sh

# Setup system
. $THIS_PLACE/install_scripts/install_fonts.sh
. $THIS_PLACE/install_scripts/setup_system.sh

# -- HIGHLY NOT RECOMMENDED.
# -- Un-comment if you are using a laptop
# -- AND OBSESSED WITH 1.0 W USAGE.
# . $THIS_PLACE/install_scripts/i_am_using_laptop.sh

# Post-installation
. $THIS_PLACE/install_scripts/post_install.sh

# Symlinking files
ln -sf $DOTTIES_DIR/.config/autostart 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/bspwm 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/polybar 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/systemd 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/kitty 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/picom 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/Thunar 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/rofi 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/flameshot 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/gtk-3.0 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/gtk-4.0 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/eww 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/dunst 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/chrome-flags.conf 	$HOME/.config/chrome-flags.conf
ln -sf $DOTTIES_DIR/.zshrc 						$HOME/.zshrc
ln -sf $DOTTIES_DIR/.xinitrc 					$HOME/.xinitrc
ln -sf $DOTTIES_DIR/.p10k.zsh 					$HOME/.p10k.zsh
ln -sf $DOTTIES_DIR/.gtkrc-2.0 					$HOME/.gtkrc-2.0

# What to do after this:
#       1. If you are using a touchpad: https://stackoverflow.com/questions/62990795/cannot-set-tapping-enabled-default-on-archlinux
#       2. If your keyboard has a NumLk: https://wiki.archlinux.org/title/Activating_numlock_on_bootup
#       3. You should consume these links for more battery saving on laptops:
#           https://wiki.archlinux.org/title/Power_management
#           https://wiki.archlinux.org/title/CPU_frequency_scaling
#           https://www.reddit.com/r/archlinux/comments/rz6294/arch_linux_laptop_optimization_guide_for/
#       4. If you can, use `linux-zen` kernel instead.
echo "Installation finished!!!"
echo "And please, for the love of god, DO **NOT** REMOVE THE $DOTTIES_DIR FOLDER!!!! Why? They are **ALL SYMLINKED**!"
echo "That is all, have a good day and happy ricing!"
