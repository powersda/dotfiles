#
# ~/.bashrc
#

alias mutt="neomutt && pkill -RTMIN+6 dwmblocks"
alias update="yay -Syu && kill -38 $(pidof dwmblocks)"
alias wal="wal -st"
alias vim="vim -u ~/.config/vim/.vimrc"
alias mbsync="mbsync -c ~/.config/neomutt/mbsyncrc"
alias spt="pgrep spotifyd &> /dev/null || spotifyd && spt"
alias clock="tty-clock -ct"
alias EDITOR="nvim"
#alias vim="nvim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Pywal sequences
#(cat ~/.cache/wal/sequences &)

# Update titlebar
PROMPT_COMMAND='printf "\033]0;st: %s\007" "${PWD/#$HOME/"~"}"'


