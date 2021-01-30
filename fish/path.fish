
# User paths
set user_paths $user_paths      \
    $HOME/.composer/vendor/bin  \
    $HOME/.local/bin            \
    $HOME/.pyenv/bin            \
    $HOME/.rbenv/bin            \
    $HOME/flutter/bin           \
    /usr/local/go/bin           \
    /usr/local/sbin             \
    /usr/lib/ccache             \

for path in $user_paths
    if test -d $path
        set -x PATH $path $PATH
    end
end

