#
# ~/.bashrc
#

alias mutt="neomutt && pkill -RTMIN+6 dwmblocks"
alias vim="vim -u ~/.config/vim/.vimrc"
alias mbsync="mbsync -c ~/.config/neomutt/mbsyncrc"
alias spt="pgrep spotifyd &> /dev/null || spotifyd && spt"
alias clock="tty-clock -ct"
alias wiki="nvim -c VimwikiIndex"
#alias vim="nvim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Update titlebar
PROMPT_COMMAND='printf "\033]0;st: %s\007" "${PWD/#$HOME/"~"}"'


