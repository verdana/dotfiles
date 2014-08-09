
# 设定 zsh 选项
for option (
    autocd
    autopushd
    extended_history
    append_history      #
    share_history       # 在 SHELL 间共享历史记录
    hist_ignore_dups    # 防止历史记录出现连续重复的条目
    correct             # 拼写检查建议
    pushdsilent
    pushdtohome
    pushdignoredups
    pushdminus
) setopt $option

# 设定标题
case $TERM in
xterm*|rxvt*)
     precmd() { print -Pn "\e]0; [%n@%M] %~\a" }
    preexec() { print -Pn "\e]0; [%n@%M] %~ ($1)\a" }
    ;;
esac

# Tmux 中按 CTRL+S 会锁死
# Disable CTRL+S from sending XOFF
stty ixany
stty ixoff -ixon

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

