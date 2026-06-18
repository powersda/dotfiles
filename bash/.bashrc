#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cloud='rclone mount filen: ~/cloud --daemon --vfs-cache-mode full'
alias clock='tty-clock -ctC 6'
alias pipes='pipes.sh'
alias rclone='rclone --progress'
# alias spotify='echo -ne "\033]0;Spotify\007" && spotify_player'
# alias ai='aichat'

snap-home() { sudo btrfs subvolume snapshot -r /home /.snapshots/home/"$1"; }
snap-var() { sudo btrfs subvolume snapshot -r /var /.snapshots/var/"$1"; }
snap-root() { sudo btrfs subvolume snapshot -r / /.snapshots/root/"$1"; }


PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
