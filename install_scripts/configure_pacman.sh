#!/bin/bash

sudo sed -i 's/#ILoveCandy/ILoveCandy/g' /etc/pacman.conf
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
