# Created by newuser for 5.0
#
# verdana.cn@gmail.com
# https://github.com/verdana/dotfiles
#

#------------------------------
# Alias
#------------------------------
if [[ "`uname`" == 'FreeBSD' ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
fi

alias box='$HOME/.bin/dropbox'
alias grep='grep --color=auto'
alias iptables='sudo iptables'
alias ll='ls -lhA'
alias mkdir='mkdir -pv'
alias mnt='sudo mount | column -t'
alias php='php -n'
alias so='source'
alias vims='sudo vim'
alias wget='wget --content-disposition'
alias wow='git status'

# Arch Linux
grep "Arch" /etc/issue -i -q > /dev/null 2>&1
if [ $? = "0" ]; then
    alias jc='sudo journalctl'
    alias jcb='sudo journalctl -b'
    alias sys='sudo systemctl'

    # Pacman
    alias pacupg='sudo pacman -Syu'             # Synchronize with repositories before upgrading packages that are out of date on the local system.
    alias pacin='sudo pacman -S'                # Install specific package(s) from the repositories
    alias pacins='sudo pacman -U'               # Install specific package not from the repositories but from a file
    alias pacre='sudo pacman -R'                # Remove the specified package(s), retaining its configuration(s) and required dependencies
    alias pacrem='sudo pacman -Rns'             # Remove the specified package(s), its configuration(s) and unneeded dependencies
    alias pacss='pacman -Ss'                    # Search for package(s) in the repositories
    alias pacupd='sudo pacman -Sy && sudo abs'  # Update and refresh the local package and ABS databases against repositories
    alias pacinsd='sudo pacman -S --asdeps'     # Install given package(s) as dependencies of another package
    alias pacmir='sudo pacman -Syy'             # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
fi

# Gentoo
uname -r | grep "gentoo" > /dev/null
if [ $? = "0" ]; then
    # Poatage
    alias dc="sudo dispatch-conf"
    alias em="sudo emerge --ask"
    alias es="sudo eix-sync"
    alias rr="sudo revdep-rebuild"
    alias se="sudo eselect"
fi

#------------------------------
# Comp
#------------------------------
autoload -U compinit && compinit -i
autoload -U colors   && colors

# 改进补全风格
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings'     format '%BSorry, no matches for: %d%b'

# 忽略大小写
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# 使用菜单完成进程 ID
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:pacman:*'   force-list always
zstyle ':completion:*:*:kill:*'   menu yes select
zstyle ':completion:*:kill:*'     force-list always
zstyle ':completion:*:*:pkill:*'  menu yes select
zstyle ':completion:*:pkill:*'    force-list always

# 历史记录
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# 目录堆菜单
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

#------------------------------
# ZSH Prompt
#------------------------------
autoload -U promptinit && promptinit
prompt pure

PURE_GIT_PULL=0 # 禁止检查 git 仓库目录是否有更新

#setopt PROMPT_SUBST     # 允许命令提示符中使用函数

# 当前工作目录
#function collapse_pwd {
#    echo $(pwd | sed -e "s,^$HOME,~,")
#}

# 当前 GIT 仓库分支
#function git_prompt {
#    ref=$(git symbolic-ref HEAD | cut -d'/' -f3) 2>/dev/null
#    if [[ -n "$ref" ]]; then
#        echo "on %{$fg[cyan]%}$ref%{$reset_color%} "
#    fi
#}

#PROMPT='%{$fg[magenta]%}%n%{$reset_color%} '
#PROMPT+='at %{$fg[yellow]%}%m%{$reset_color%} '
#PROMPT+='in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} '
#PROMPT+='$(git_prompt)'

#------------------------------
# Dirstack
#------------------------------
DIRSTACKSIZE=20
DIRSTACKFILE="$HOME/.cache/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

#------------------------------
# Window title
#------------------------------
case $TERM in
xterm*|rxvt*)
    precmd() {  print -Pn "\e]0; [%n@%M] %~\a" }
    preexec() { print -Pn "\e]0; [%n@%M] %~ ($1)\a" }
    ;;
esac

# Tmux 中按 CTRL+S 会锁死
# Disable CTRL+S from sending XOFF
stty ixany
stty ixoff -ixon

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

