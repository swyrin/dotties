#!/bin/sh

xsetroot -cursor_name left_ptr

# https://wiki.archlinux.org/title/xinit
# "Ensure the last if block ..."
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec bspwm
