#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rclone='rclone --progress'
# alias spotify='echo -ne "\033]0;Spotify\007" && spotify_player'

snap-home() { sudo btrfs subvolume snapshot -r /home /.snapshots/home/"$1"; }
snap-var() { sudo btrfs subvolume snapshot -r /var /.snapshots/var/"$1"; }
snap-root() { sudo btrfs subvolume snapshot -r / /.snapshots/root/"$1"; }


PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
