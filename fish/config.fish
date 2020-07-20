# Common env variables
set -gx Language    en_US.en
set -gx LANG        en_US.UTF-8
set -gx LC_ALL      en_US.UTF-8
set -gx LC_COLLATE  C
set -gx VISUAL      vim
set -gx EDITOR      vim

# Java & android
set -gx JAVA_HOME           "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
set -gx ANDROID_SDK_ROOT    "$HOME/Library/Android/sdk"

# do not use ANDROID_HOME anymore

# Simple alias
alias svc='supervisorctl'
alias df='df -PH'
alias ar2='aria2c'

# User paths
set user_paths $user_paths              \
    $HOME/.cargo/bin                    \
    $HOME/.composer/vendor/bin          \
    $HOME/.fastlane/bin                 \
    $HOME/.local/bin                    \
    $HOME/.pyenv/bin                    \
    $HOME/.rbenv/bin                    \
    $HOME/flutter/bin                   \
    /usr/lib/ccache                     \
    /usr/local/clang-9.0.0/bin          \
    /usr/local/go/bin                   \
    /usr/local/opt/ruby/bin             \
    /usr/local/sbin

for path in $user_paths
    if test -d $path
        set -x PATH $path $PATH
    end
end

# Pure prompt
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

# Change the prompt text
set pure_symbol_prompt                  ">"
set pure_symbol_reverse_prompt          "<"
set pure_right_prompt                   " "
set pure_symbol_git_unpulled_commits    "➘"
set pure_symbol_git_unpushed_commits    "➚"
set pure_symbol_git_dirty               "✲"
set pure_symbol_title_bar_separator     "-"

set pure_color_git_branch   red
set pure_color_git_dirty    red

# Homebrew
if command -sq brew
    set -gx HOMEBREW_BOTTLE_DOMAIN  https://mirrors.ustc.edu.cn/homebrew-bottles
end

# pyenv init
if type "pyenv" > /dev/null 2>&1
    status --is-interactive; and source (pyenv init -|psub)
end

# rbenv init
if type "rbenv" > /dev/null 2>&1
    # Build ruby with brew openssl
    set -gx RUBY_CONFIGURE_OPTS  "--with-openssl-dir="(brew --prefix openssl@1.1)
    status --is-interactive; and source (rbenv init -|psub)
end

# flutter china mirror
if command -sq flutter
    set -gx PUB_HOSTED_URL           https://pub.flutter-io.cn
    set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
end

# php composer
if command -sq composer
    set -gx COMPOSER_MEMORY_LIMIT -1
end

# ccache
if command -sq ccache
    set -gx CCACHE_PATH /usr/bin
    set -gx CCACHE_DIR  /tmp/ccache
end

