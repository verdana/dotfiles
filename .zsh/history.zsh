
#zstyle ':completion:*:history-words' stop yes
#zstyle ':completion:*:history-words' remove-all-dups yes
#zstyle ':completion:*:history-words' list false
#zstyle ':completion:*:history-words' menu yes

export HISTFILE="$zsh/data/.history"
export HISTSIZE=999
export SAVEHIST=$HISTSIZE

# vim: set fdm=marker ff=unix sw=4 ts=4 et:
