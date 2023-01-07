#
# ~/.bashrc
#

alias mutt="neomutt && pkill -sIGRTMIN+7 waybar"
alias mbsync="mbsync -c ~/.config/neomutt/mbsyncrc"
alias spt="pgrep spotifyd &> /dev/null || spotifyd && spt"
alias clock="tty-clock -ct"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Update titlebar
PROMPT_COMMAND='printf "\033]0;st: %s\007" "${PWD/#$HOME/"~"}"'
