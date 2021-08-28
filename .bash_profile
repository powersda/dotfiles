#
# ~/.bash_profile
#
export HISTFILE=~/.cache/bash/.bash_history
export XINITRC=~/.config/X11/.xinitrc
export WGETRC=~/.config/wget/.wgetrc
export LESSHISTFILE=-
export EDITOR=nvim

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If using tty1, start X11
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec startx ~/.config/X11/.xinitrc
fi
