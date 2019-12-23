#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vlc='vlc --qt-minimal-view'
alias clock='tty-clock -tcC 4'
alias mutt='neomutt'
alias scrot='scrot -ze "mv \$f ~/Screenshots/\$f.png; echo \"Screeshot taken!\""'

PS1='[\u@\h \W]\$ '
(cat ~/.cache/wal/sequences &)
