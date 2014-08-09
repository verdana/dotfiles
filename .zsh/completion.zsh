
# 初始化高级自动补全
autoload -Uz compinit
compinit

# 启用自动完成菜单
zstyle ':completion:*'  menu yes select
zstyle ':completion:*'  force-list always

# 忽略大小写
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# 启用缓存
zstyle ':completion::complete:*' use-cache  1
zstyle ':completion::complete:*' cache-path $zsh/data/completion.cache

# 分组与信息
zstyle ':completion:*'  group-name ''
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No matches found --\e[0m'

# 目录堆菜单
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# 快速目录切换
DIRSTACKSIZE=20
DIRSTACKFILE=$zsh/data/.dirstack

if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]
then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

chpwd() {
    print -l $PWD ${(u)dirstack} > $DIRSTACKFILE
}

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

