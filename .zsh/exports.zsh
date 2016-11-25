
# 设定默认编辑器
export EDITOR="`whence vim`"

# 设定 TERM
export TERM="xterm-256color"

# 禁用 LESS  命令记录
export LESSHISTFILE="/dev/null"

# 禁用 MySQL 命令记录
export MYSQL_HISTFILE="/dev/null"

# Golang 加入到 PATH 中
export PATH="/usr/local/go/bin:$PATH"

# 将 node_modules 目录加入到 PATH 中
export PATH="$HOME/node_modules/.bin:$PATH"

# 以下的路径中搜索可自动载入的函数
fpath=( "$HOME/.zsh" $fpath)
export FPATH

# 语言
export LANG=en_US.UTF-8
export LC_COLLATE=C

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

