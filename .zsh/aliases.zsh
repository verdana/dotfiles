# Misc
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mnt='sudo mount | column -t'
alias sml='systemctl'
alias tree='tree -Ca -I ".git|*.swp|*.egg-info"'
alias wget='wget --content-disposition'
alias wow='git ss && git pull && git sp && git one -5'

# Gentoo
uname -r | grep 'gentoo' > /dev/null
if [ $? = '0' ]; then
    # Poatage
    alias eu='sudo etc-update'
    alias es='sudo eix-sync'
    alias em='sudo emerge --ask'

    # Rebuilding your entire system
    alias em-update='sudo emerge -uDNav @world'

    # Remove package
    alias em-remove='sudo emerge --unmerge'

    # Removing obsoleted packages
    alias em-clean='sudo emerge --depclean'

    # Running revdep-rebuild
    alias rr='sudo revdep-rebuild -p'
fi

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

