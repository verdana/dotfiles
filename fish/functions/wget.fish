function wget
    switch (uname)
        case Linux
            /usr/bin/wget --content-disposition $argv
        case Darwin
            /usr/local/bin/wget --content-disposition $argv
    end
end
