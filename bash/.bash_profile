#
# ~/.bash_profile
#
#
export EDITOR=nvim

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]]; then
    start-hyprland
fi
