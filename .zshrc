#
# verdana.cn@gmail.com
# https://github.com/verdana/dotfiles
#
# Update: Saturday Sep 12, 2015 10:44
#

# zsh 目录
export zsh=~/.zsh

# 数据目录
[[ -d $zsh/data ]] || mkdir -p $zsh/data

# 按照顺序加载文件
typeset -U dotfiles
dotfiles=(
    "options"
    "exports"
    "completion"
    "aliases"
    "bindkeys"
    "platform"
    "history"
    "prompt"

    # 第三方插件
    "zsh-syntax-highlighting"
)
for file in $dotfiles; do
    file="$zsh/$file.zsh"
    [[ -f $file ]] && source $file
done

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

