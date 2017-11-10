function recursive-touch
    #/bin/bash -c "find . -exec touch {} \;"
    find . -print0 | xargs -0 touch
end
