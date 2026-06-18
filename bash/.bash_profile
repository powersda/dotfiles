#
# ~/.bash_profile
#
#
export EDITOR=nvim
export XDG_DATA_HOME=/home/pwrhs/.local/share

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec niri-session -l
fi
