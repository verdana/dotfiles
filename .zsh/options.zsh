
# ZSH Options
for option (
    autocd                  # 切换目录时省略 cd 命令，直接输入路径
    hist_ignore_all_dups    # 若命令重复则删除旧的命令记录
) setopt $option

# Tmux 中按 CTRL+S 会锁死
# Disable CTRL+S from sending XOFF
if [[ -n "$TMUX" ]]; then
    stty ixany
    stty ixoff -ixon
fi

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

