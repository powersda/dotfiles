#
# ~/.bash_profile
#

bgcolour="#282828"
fgcolour="#D8DEE9"
hlcolour="#B48EAD"

export HISTFILE=~/.cache/bash/.bash_history
export XINITRC=~/.config/X11/.xinitrc
export WGETRC=~/.config/wget/.wgetrc
export LESSHISTFILE=-
export EDITOR=nvim
export BEMENU_OPTS="-i -p '' -H 30 --fn Ubuntu Nerd Font 15 --fb '$bgcolour' --ff '$fgcolour' --hf '$bgcolour' --hb '$hlcolour' --nb '$bgcolour' --nf '$fgcolour' --ab '$bgcolour' --af '$fgcolour'"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If using tty1, start X11
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland 
fi
