
# User paths
set user_paths $user_paths      \
    /usr/local/bin              \
    /usr/local/sbin             \
    /usr/local/cmake/bin        \
    /usr/local/go/bin           \
    /usr/local/opt/mysql-client/bin \
    /usr/local/opt/node@18/bin      \
    /usr/local/opt/redis@6.2/bin    \
    /usr/lib/ccache             \
    $HOME/.cargo/bin            \
    $HOME/.composer/vendor/bin  \
    $HOME/.emacs.d/bin          \
    $HOME/.flutter/bin          \
    $HOME/.go/bin               \
    $HOME/.local/bin            \
    $HOME/.minio/bin            \
    $HOME/.pyenv/bin            \
    $HOME/.rbenv/bin            \
    $HOME/.seaweed/bin          \
    $HOME/.tiup/bin             \
    $HOME/bin                   \
    $HOME/flutter/bin

for path in $user_paths
    if test -d $path
        fish_add_path -g $path
    end
end

