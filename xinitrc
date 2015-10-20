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
while true; do
		xsetroot -name "$( mpc current )   VOL - $( amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/' )   DATE - $( date +"%F" )   TIME - $( date +"%R" )"
	sleep 1s
done &

exec dwm
# exec i3
