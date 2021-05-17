# Launch screen compositor
picom --experimental-backends &

# Set custom keybindings
xmodmap -e "keycode 107 = Super_R"
xbindkeys -f ~/.config/X11/.xbindkeysrc

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

