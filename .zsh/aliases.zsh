
# Misc
alias box='$HOME/.bin/dropbox'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mnt='sudo mount | column -t'
alias php='php -n'
alias vi='sudo vim'
alias wget='wget --content-disposition'
alias wow='git status'
alias tree='tree -Ca -I ".git|*.swp|*.egg-info"'

# Arch Linux
grep 'Arch' /etc/issue -i -q > /dev/null 2>&1
if [ $? = '0' ]; then
    alias jc='sudo journalctl'
    alias jcb='sudo journalctl -b'
    alias sys='sudo systemctl'

    # PACMAN
    alias pacupg='sudo pacman -Syu'             # Synchronize with repositories before upgrading packages that are out of date on the local system.
    alias pacin='sudo pacman -S'                # Install specific package(s) from the repositories
    alias pacins='sudo pacman -U'               # Install specific package not from the repositories but from a file
    alias pacre='sudo pacman -R'                # Remove the specified package(s), retaining its configuration(s) and required dependencies
    alias pacrem='sudo pacman -Rns'             # Remove the specified package(s), its configuration(s) and unneeded dependencies
    alias pacss='pacman -Ss'                    # Search for package(s) in the repositories
    alias pacupd='sudo pacman -Sy && sudo abs'  # Update and refresh the local package and ABS databases against repositories
    alias pacinsd='sudo pacman -S --asdeps'     # Install given package(s) as dependencies of another package
    alias pacmir='sudo pacman -Syy'             # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
fi

# CentOS
grep 'centos' /etc/os-release > /dev/null 2>&1
if [ $? = '0' ]; then
    alias yum='sudo yum'
fi

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
    alias rr='sudo revdep-rebuild'
fi

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

