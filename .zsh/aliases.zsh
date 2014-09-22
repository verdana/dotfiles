
# Misc
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mnt='sudo mount | column -t'
alias tree='tree -Ca -I ".git|*.swp|*.egg-info"'
alias wget='wget --content-disposition'
alias wow='git status'

# HHVM
alias composer="hhvm -v Http.DefaultTimeout=3600 -v ResourceLimit.SocketDefaultTimeout=3600 -v Http.SlowQueryThreshold=600000 -v Eval.Jit=false /usr/local/bin/composer"

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

