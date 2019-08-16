function grep
    /bin/grep -HIn --exclude-dir=.svn --exclude-dir=.git $argv
end
