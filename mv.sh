#!/bin/bash
set -e

sudo pacman -S i3blocks i3status feh i3bar picom i3lock xss-lock nm-applet dmenu playerctl maim xclip i3-gaps xfce4-terminal

mkdir -pv \
    ~/Documents/system-bg/ \
    ~/.config/scripts/ \
    ~/.config/i3/ \
    ~/.config/i3blocks/ \
    ~/.config/i3status/ \
    ~/.config/xfce4/xfconf/xfce-perchannel-xml

cp -v ./xfce4/* ~/.config/xfce4/xfconf/xfce-perchannel-xml/
cp -v ./wallpaper.png ~/Documents/system-bg/
cp -v ./lock ~/.config/scripts/
cp -v ./config ~/.config/i3/
cp -v ./i3blocks.conf ~/.config/i3blocks/
cp -v ./i3status.conf ~/.config/i3status/

chmod -v a+x ~/.config/scripts/lock

if [ -n "$DISPLAY" ]; then
    i3-msg reload
    i3-msg restart
fi

echo "finished"