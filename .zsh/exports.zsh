
# 设定默认编辑器
export EDITOR="`whence vim`"

# 设定 TERM
export TERM="xterm-256color"

# 以下的路径中搜索可自动载入的函数
fpath=( "$HOME/.zsh" $fpath)
export FPATH

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

