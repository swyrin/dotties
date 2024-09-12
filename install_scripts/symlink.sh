#!/bin/bash

set -euox pipefail

# get dots directory
THIS_PLACE=$(dirname "$(realpath $0)")
THIS_PLACE="$(dirname "$THIS_PLACE")"

LINK="ln -snf"

$LINK $THIS_PLACE/.config/alacritty             $HOME/.config/alacritty
$LINK $THIS_PLACE/.config/waybar                $HOME/.config/waybar
$LINK $THIS_PLACE/.config/rofi 				    $HOME/.config/rofi
$LINK $THIS_PLACE/.config/hypr                  $HOME/.config/hypr
$LINK $THIS_PLACE/.config/gtk-3.0 			    $HOME/.config/gtk-3.0
$LINK $THIS_PLACE/.config/gtk-4.0 			    $HOME/.config/gtk-4.0
$LINK $THIS_PLACE/.config/mako                  $HOME/.config/mako
$LINK $THIS_PLACE/.config/fastfetch             $HOME/.config/fastfetch
$LINK $THIS_PLACE/.config/wlogout               $HOME/.config/wlogout

$LINK $THIS_PLACE/.config/chrome-flags.conf 	$HOME/.config/chrome-flags.conf
$LINK $THIS_PLACE/.config/chrome-flags.conf 	$HOME/.config/electron-flags.conf
$LINK $THIS_PLACE/.zshrc 						$HOME/.zshrc
$LINK $THIS_PLACE/.zprofile                     $HOME/.zprofile
$LINK $THIS_PLACE/.p10k.zsh 					$HOME/.p10k.zsh
$LINK $THIS_PLACE/.nanorc                       $HOME/.nanorc

$LINK $THIS_PLACE/assets/wallpaper.png          $HOME/Pictures/wallpaper.png
