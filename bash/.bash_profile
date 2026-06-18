#
# ~/.bash_profile
#
#
export EDITOR=nvim

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec niri-session -l
fi
