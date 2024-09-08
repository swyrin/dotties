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

# Setup symbolic links
ln -sf $THIS_PLACE/.config/alacritty           $HOME/.config/alacritty
ln -sf $THIS_PLACE/.config/waybar              $HOME/.config/waybar
ln -sf $THIS_PLACE/.config/rofi 				$HOME/.config/rofi
ln -sf $DOTTIES_DIT/.config/hypr                $HOME/.config/hypr
ln -sf $THIS_PLACE/.config/gtk-3.0 			$HOME/.config/gtk-3.0
ln -sf $THIS_PLACE/.config/gtk-4.0 			$HOME/.config/gtk-4.0
ln -sf $THIS_PLACE/.config/chrome-flags.conf 	$HOME/.config/chrome-flags.conf
ln -sf $THIS_PLACE/.config/chrome-flags.conf 	$HOME/.config/electron-flags.conf
ln -sf $THIS_PLACE/.zshrc 						$HOME/.zshrc
ln -sf $THIS_PLACE/.zprofile                   $HOME/.zprofile
ln -sf $THIS_PLACE/.p10k.zsh 					$HOME/.p10k.zsh
ln -sf $THIS_PLACE/.nanorc                     $HOME/.nanorc


# -- HIGHLY NOT RECOMMENDED.
# -- Un-comment if you are using a laptop
# -- AND OBSESSED WITH 1.0 W USAGE.
# . $THIS_PLACE/install_scripts/i_am_using_laptop.sh

# Post-installation
. $THIS_PLACE/install_scripts/post_install.sh
