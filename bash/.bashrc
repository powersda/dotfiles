#
# ~/.bashrc
#

# alias mutt="neomutt && pkill -sIGRTMIN+7 waybar"
# alias mbsync="mbsync -c ~/.config/neomutt/mbsyncrc"
alias spt="pgrep spotifyd &> /dev/null || spotifyd && spt"
alias clock="tty-clock -ctC 7"
alias ls='ls --color=auto'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Update titlebar
PROMPT_COMMAND='printf "\033]0;st: %s\007" "${PWD/#$HOME/"~"}"'
eval "$(starship init bash)"
