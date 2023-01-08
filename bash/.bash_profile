#
# ~/.bash_profile
#

bgcolour="#282828"
fgcolour="#DCE3ED"
hlcolour="#285577"
hlcolour2="#4C7899"
hlcolour3="#8EBBDD"

export HISTFILE=~/.cache/bash/.bash_history
export XINITRC=~/.config/X11/.xinitrc
export WGETRC=~/.config/wget/.wgetrc
export LESSHISTFILE=-
export EDITOR=nvim
export BEMENU_OPTS="-i -p '' -H 30 --fn 'Ubuntu Nerd Font' --tb '$bgcolour' --tf '$fgcolour' --fb '$bgcolour' --ff '$fgcolour' --hf '$fgcolour' --hb '$hlcolour' --nb '$bgcolour' --nf '$fgcolour' --ab '$bgcolour' --af '$fgcolour'"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If using tty1, start X11
if [[ "$(tty)" == "/dev/tty1" ]]; then
    Hyprland 
fi
