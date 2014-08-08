
# 平台差异
case $( uname -s ) in
    Darwin)
        source $zsh/platform_mac.zsh ;;
    FreeBSD)
        source $zsh/platform_freebsd.zsh ;;
    Linux)
        source $zsh/platform_linux.zsh ;;
esac

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

