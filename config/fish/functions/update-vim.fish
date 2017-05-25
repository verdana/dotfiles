function update-vim
    set -lx SHELL (which sh)
    vim +PlugUpdate! +PlugClean +qall
end
