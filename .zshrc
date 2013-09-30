# Created by newuser for 5.0
# vim: set ff=unix shiftwidth=4 tabstop=4 expandtab:

# Pacman alias
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacsi='pacman -Si'               # Display information about a given package in the repositories
alias pacss='pacman -Ss'               # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database

# Additional pacman alias
alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# Other alias commands
alias ls='ls --color=auto'
alias ll='ls -lhA'
alias dir='ls -lhA'
alias axel='axel -n 1 -a'
alias wget='wget --trust-server-names'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias halt='sudo halt'

alias sys='sudo systemctl'
alias jc='sudo journalctl'
alias jcb='sudo journalctl -b'
alias mnt='sudo mount | column -t'

# 开启补全系统
autoload -U compinit
compinit -i

# 导入颜色
autoload -U colors
colors

# 改进补全风格
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*' squeeze-slashes true

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# 使用菜单完成进程 ID
zstyle ':completion:*:*:kill:*'  menu yes select
zstyle ':completion:*:kill:*'    force-list always
zstyle ':completion:*:*:pkill:*' menu yes select
zstyle ':completion:*:pkill:*'   force-list always

# 历史记录
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# cd directory stack menu
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# 允许命令提示符中使用函数
setopt PROMPT_SUBST

# 当前工作目录
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# 当前 GIT 仓库分支
function git_prompt {
    ref=$(git symbolic-ref HEAD | cut -d'/' -f3) 2>/dev/null
    if [[ -n "$ref" ]]; then
        echo "on %{$fg[cyan]%}$ref%{$reset_color%} "
    fi
}

# Prompt > style 1
#PROMPT=$'[%{$fg[blue]%}%T%{$reset_color%}] '
#PROMPT+=$'%{$fg[green]%}%d%{$reset_color%}$(prompt_git_info)%{${fg[default]}%} '

# Prompt > style 2
#PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '

# Prompt > style 3
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} '
PROMPT+='at %{$fg[yellow]%}%m%{$reset_color%} '
PROMPT+='in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} '
PROMPT+='$(git_prompt)'

# TERM
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# Update TITLE
case $TERM in
    xterm*)
        chpwd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac


# 自动载入 zsh 函数
#fpath=(~/.zsh/git $fpath)
#autoload -U ~/.zsh/git/*(:t)

# 每次登陆 SHELL 后自动启动 tmux
#if which tmux 2>&1 > /dev/null; then
    # if no session is started, start a new session
#    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
#    while test -z ${TMUX}; do
#        tmux attach || break
#    done
#fi

# Disable CTRL+S from sending XOFF
stty ixany
stty ixoff -ixon

