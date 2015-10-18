#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

synclient TouchpadOff=1 &
urxvtd &
# note - unclutter is using the unclutter-xfixes-git package from the AUR
unclutter &
xrdb -load ~/.Xresources &
xmodmap ~/.capswap &
nitrogen --restore &
mpd &
compton & 

# dwmstatus &

# exec dwm
exec i3
