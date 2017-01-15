function update-vim
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
