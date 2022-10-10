#!/bin/sh

# Launch screen compositor
picom --experimental-backends &

# Set up dual monitors
~/.local/bin/hotplug

# Set custom keybindings
xmodmap -e "keycode 107 = Super_R"
xbindkeys -f ~/.config/X11/.xbindkeysrc

# Begin listening to sleep state to lock screen
xss-lock -- slock &

# Fix for android-studio rendering
export _JAVA_AWT_WM_NONREPARENTING=1

# Intialize X11 database
[[ -f ~/.config/X11/.xresources ]] && xrdb -merge -I $HOME ~/.config/X11/.xresources

# Set wallpaper
#wal -R
#feh --no-fehbg --bg-fill /home/pwrhs/Backgrounds/Current/*
xwallpaper --zoom /home/pwrhs/wallpapers/current/*

# Begin the status bar
dwmblocks &

# Source system scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Execute window manager
exec dwm

