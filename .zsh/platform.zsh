
# 平台差异
case $( uname -s ) in
    CYGWIN*)
        source $zsh/platform/cygwin.zsh ;;
    MSYS*)
        source $zsh/platform/msys.zsh ;;
    Darwin)
        source $zsh/platform/mac.zsh ;;
    FreeBSD)
        source $zsh/platform/freebsd.zsh ;;
    Linux)
        source $zsh/platform/linux.zsh ;;
esac

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

