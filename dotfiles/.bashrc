#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vlc='vlc --qt-minimal-view'
alias ncmpcpp='pgrep mopidy && exec ncmpcpp || nohup mopidy &> /dev/null & exec ncmpcpp'
PS1='[\u@\h \W]\$ '

(cat ~/.cache/wal/sequences &)
