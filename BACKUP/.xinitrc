#! /bin/bash

#Remap menu button to Super
xmodmap -e "keycode 135 = Super_R"

# Refresh X resources DB
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# Check for external monitor, and connect
if xrandr | grep "VGA-1 connected" &> /dev/null; then
    xrandr --output VGA-1 --above LVDS-1 --auto
fi

# Load i3-gaps
exec i3

