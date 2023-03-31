
# navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# shortcuts
alias df='df -P -klH'

# apt
alias apt-proxy='sudo apt-get -c ~/.apt_proxy'

# aria2c
if command -sq aria2c
    alias ar2='aria2c'
end

# git
if command -sq git
    alias push='git push'
    alias master='git co master'
    alias trunk='git co trunk'
end

# nvim
if command -sq nvim
    alias vim=nvim
end

# lazygit
if command -sq lazygit
    alias lg=lazygit
end

# kitty ssh
if command -sq kitty
    alias ssh="kitty +kitten ssh"
end

# kubectl
if command -sq kubectl
    alias k="kubectl"
    alias kf="kubectl -n face-dev"
    alias kn="kubectl -n ingress-nginx"
end

