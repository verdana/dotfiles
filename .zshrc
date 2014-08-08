# Created by newuser for 5.0
#
# verdana.cn@gmail.com
# https://github.com/verdana/dotfiles
#
# Update: Friday Aug 08, 2014 23:09
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
    "platform"
    "history"
    "prompt"
)
for file in $dotfiles; do
    file="$zsh/$file.zsh"
    [[ -f $file ]] && source $file
done

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

