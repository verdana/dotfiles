
# 设定默认编辑器
export EDITOR="`whence vim`"

# 设定 TERM
export TERM="xterm-256color"

# 禁用 MySQL 命令记录
export MYSQL_HISTFILE="/dev/null"

# /usr/local 加入到 PATH 中

export PATH="/usr/local/opt/ccache/libexec:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH"

# JAVA CLASSPATH
export CLASSPATH="${CLASSPATH}:$HOME/.classes"

# 以下的路径中搜索可自动载入的函数
fpath=( "$HOME/.zsh" $fpath)
export FPATH

export LC_COLLATE="C"

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

