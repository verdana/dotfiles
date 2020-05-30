function __fish_complete_ppa
    set -l repos (find /etc/apt/sources.list.d -name "*.list")
    for p in $repos
        printf '%s\n' (basename $p)
    end
end

complete -f -c update-repo -a '(__fish_complete_ppa)'
