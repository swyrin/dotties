#!/bin/bash

# --- Enable output color, with a hack to enable pacman effect
sudo sed -i 's/#Color/Color\nILoveCandy/g'                      /etc/pacman.conf

# --- Enable parallel downloading
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' /etc/pacman.conf

# --- Enable multilib
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//'                  /etc/pacman.conf    # --- Enable multilib
