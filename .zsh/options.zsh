
# ZSH Options
for option (
    autocd                  # 切换目录时省略 cd 命令，直接输入路径
    hist_ignore_all_dups    # 若命令重复则删除旧的命令记录
) setopt $option

# 关闭 Software Flow Control （XON/XOFF）
stty -ixon

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

