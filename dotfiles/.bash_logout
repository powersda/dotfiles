#
# ~/.bash_logout
#

if pgrep openvpn &>/dev/null; then
    sudo pkill openvpn
fi
