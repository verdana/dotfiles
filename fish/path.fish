
# User paths
set user_paths $user_paths          \
    $HOME/.cargo/bin                \
    $HOME/.composer/vendor/bin      \
    $HOME/.local/bin                \
    $HOME/.pyenv/bin                \
    $HOME/.rbenv/bin                \
    $HOME/flutter/bin               \
    $HOME/go/bin                    \
    /usr/local/cmake/bin            \
    /usr/local/go/bin               \
    /usr/local/opt/mysql-client/bin \
    /usr/local/sbin                 \
    /usr/lib/ccache                 \

for path in $user_paths
    if test -d $path
        # set -x PATH $path $PATH
        fish_add_path -U $path
    end
end
