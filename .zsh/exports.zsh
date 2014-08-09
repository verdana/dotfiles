
# 设定默认编辑器
if [[ ${+EDITOR} -eq 0 ]]
then
    if whence vim > /dev/null 2>&1
    then
        export EDITOR="`whence vim`"
    fi
fi

# 设定默认 DISPLAY
export DISPLAY=:0.0

# 设定 TERM
export TERM="xterm-256color"
if [[ `uname -s` == *CYGWIN* ]]; then
    export TERM="cygwin"
fi

# 设定路径
path=(
  "$HOME/.bin"
  /usr/local/bin
  /usr/local/sbin
  /bin
  /sbin
  /usr/bin
  /usr/sbin
)
export PATH
typeset -U PATH # 删除重复记录保证唯一

# 以下的路径中搜索可自动载入的函数
fpath=(
    "$HOME/.zsh"
    $fpath
)
export FPATH
typeset -U fpath   # 删除重复记录保证唯一

