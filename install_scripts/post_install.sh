#!/bin/bash

set -e
set -u
set -o pipefail
set -x

# Create XDG user directories
LC_ALL=en_US.UTF-8 xdg-user-dirs-update --force

# Change shell to zsh
chsh -s /usr/bin/zsh $(whoami)

