function grep
    switch (uname)
        case Linux
            /bin/grep -In --color=always --exclude-dir=.svn --exclude-dir=.git $argv
        case Darwin
            /usr/bin/grep -In --color=always --exclude-dir=.svn --exclude-dir=.git $argv
    end
end
